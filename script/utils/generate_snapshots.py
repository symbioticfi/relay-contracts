#!/usr/bin/env python3
"""Generate stable size and gas reports, failing when Forge checks fail."""

from __future__ import annotations

import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
SNAPSHOTS_DIR = ROOT / "snapshots"


def run_forge(*args: str) -> str:
    result = subprocess.run(
        ["forge", *args], cwd=ROOT, capture_output=True, text=True
    )
    if result.returncode:
        sys.stderr.write(result.stdout)
        sys.stderr.write(result.stderr)
        raise SystemExit(result.returncode)
    return result.stdout


def report_tables(output: str) -> str:
    tables: list[str] = []
    current: list[str] | None = None
    for line in output.splitlines():
        if line.startswith("╭"):
            current = []
        if current is not None:
            current.append(line)
            if line.startswith("╰"):
                tables.append("\n".join(current))
                current = None
    if not tables:
        raise ValueError("Forge output did not contain any report tables")
    return "\n\n".join(sorted(tables)) + "\n"


def main() -> None:
    run_forge("build")
    sizes = report_tables(run_forge("build", "--sizes"))
    test_output = run_forge(
        "test",
        "--isolate",
        "--gas-report",
        "--threads",
        "1",
        "--fuzz-seed",
        "0x" + "0" * 63 + "1",
        "--fuzz-runs",
        "1000",
    )
    gas = report_tables(test_output)
    for line in test_output.splitlines():
        if line.startswith("Ran ") and "test suites in " in line:
            print(line)
    SNAPSHOTS_DIR.mkdir(parents=True, exist_ok=True)
    (SNAPSHOTS_DIR / "sizes.txt").write_text(sizes)
    (SNAPSHOTS_DIR / "gas.txt").write_text(gas)


if __name__ == "__main__":
    main()
