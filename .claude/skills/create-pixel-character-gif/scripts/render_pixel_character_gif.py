#!/usr/bin/env python3
"""Render Typst pixel-character functions as a looping GIF."""

from __future__ import annotations

import argparse
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path


def run(cmd: list[str], cwd: Path) -> None:
    subprocess.run(cmd, cwd=cwd, check=True)


def resolve_path(repo: Path, value: str) -> Path:
    path = Path(value).expanduser()
    if not path.is_absolute():
        path = repo / path
    return path.resolve()


def typst_string(path: Path) -> str:
    return str(path).replace("\\", "/")


def build_sequence(count: int, ping_pong: bool) -> list[int]:
    sequence = list(range(count))
    if ping_pong and count > 2:
        sequence.extend(range(count - 2, 0, -1))
    return sequence


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Render Typst pixel-character functions into a looping GIF."
    )
    parser.add_argument("--repo", default=".", help="Typst project root")
    parser.add_argument(
        "--typst-file",
        default="lib.typ",
        help="Typst file exporting the character functions, relative to repo by default",
    )
    parser.add_argument("--output", required=True, help="Output GIF path")
    parser.add_argument(
        "--functions",
        nargs="+",
        required=True,
        help="Typst function names to render as frames, in order",
    )
    parser.add_argument("--size-pt", type=float, default=192.0, help="Frame page size in pt")
    parser.add_argument("--ppi", type=int, default=96, help="PNG render PPI")
    parser.add_argument(
        "--delay",
        type=int,
        default=10,
        help="GIF frame delay in centiseconds",
    )
    parser.add_argument("--loop", type=int, default=0, help="GIF loop count; 0 means forever")
    parser.add_argument(
        "--background",
        default="white",
        help='Typst page fill expression, for example white, none, or rgb("#ffffff")',
    )
    parser.add_argument(
        "--no-ping-pong",
        action="store_true",
        help="Use exactly the listed frames instead of appending reverse middle frames",
    )
    parser.add_argument(
        "--save-source",
        help="Optional path to save the generated Typst frame source",
    )
    args = parser.parse_args()

    if shutil.which("typst") is None:
        print("error: typst command not found", file=sys.stderr)
        return 127
    if shutil.which("magick") is None:
        print("error: magick command not found", file=sys.stderr)
        return 127

    repo = Path(args.repo).expanduser().resolve()
    typst_file = resolve_path(repo, args.typst_file)
    output = resolve_path(repo, args.output)
    output.parent.mkdir(parents=True, exist_ok=True)

    if not repo.exists():
        print(f"error: repo does not exist: {repo}", file=sys.stderr)
        return 2
    if not typst_file.exists():
        print(f"error: Typst file does not exist: {typst_file}", file=sys.stderr)
        return 2
    if not str(typst_file).startswith(str(repo)):
        print("error: typst-file must be inside repo", file=sys.stderr)
        return 2

    temp_dir = Path(tempfile.mkdtemp(prefix=".pixel-character-gif-", dir=repo))
    try:
        source = temp_dir / "frames.typ"
        frame_pattern = temp_dir / "frame-{p}.png"
        rel_import = Path(typst_string(Path("../") / typst_file.relative_to(repo)))

        pages = []
        for function_name in args.functions:
            pages.append(f"#render-frame({function_name})")
        source.write_text(
            "\n".join(
                [
                    f'#import "{typst_string(rel_import)}": {", ".join(args.functions)}',
                    "",
                    f"#set page(width: {args.size_pt}pt, height: {args.size_pt}pt, margin: 0pt, fill: {args.background})",
                    "",
                    f"#let render-frame(char) = align(center + horizon, char(size: {args.size_pt}pt, baseline: 0pt))",
                    "",
                    "\n#pagebreak()\n".join(pages),
                    "",
                ]
            ),
            encoding="utf-8",
        )

        if args.save_source:
            save_source = resolve_path(repo, args.save_source)
            save_source.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(source, save_source)

        run(
            [
                "typst",
                "compile",
                "--root",
                str(repo),
                "--format",
                "png",
                "--ppi",
                str(args.ppi),
                str(source),
                str(frame_pattern),
            ],
            cwd=repo,
        )

        sequence = build_sequence(len(args.functions), not args.no_ping_pong)
        frame_paths = [str(temp_dir / f"frame-{index + 1}.png") for index in sequence]
        missing = [path for path in frame_paths if not Path(path).exists()]
        if missing:
            print(f"error: missing rendered frame(s): {missing}", file=sys.stderr)
            return 1

        run(
            [
                "magick",
                "-delay",
                str(args.delay),
                *frame_paths,
                "-loop",
                str(args.loop),
                "-layers",
                "Optimize",
                str(output),
            ],
            cwd=repo,
        )
    finally:
        shutil.rmtree(temp_dir, ignore_errors=True)

    print(f"wrote {output}")
    if args.save_source:
        print(f"saved source {resolve_path(repo, args.save_source)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
