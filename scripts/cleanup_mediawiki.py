#!/usr/bin/env python3
"""
Clean up remaining MediaWiki artifacts from markdown files.

1. Remove "Redirected from" notices
2. Remove orphaned colons (`:` on their own line, often before category links)
3. Remove trailing category link sections
"""

import re
import sys
from pathlib import Path


def clean_file(filepath, dry_run=False):
    """Clean MediaWiki artifacts from a file."""
    path = Path(filepath)
    content = path.read_text()
    original = content

    # 1. Remove "Redirected from" notices
    # Pattern: (Redirected from [link])
    content = re.sub(
        r'\n*\(Redirected from\s*\n?\[.*?\]\([^)]*\)\)',
        '',
        content,
        flags=re.MULTILINE | re.DOTALL
    )

    # 2. Remove orphaned colons followed by category links or at end of file
    # Pattern: a line that's just ":" possibly followed by category links
    # First, remove ": \n\n- [Category" patterns
    content = re.sub(
        r'\n:\s*\n+- \[Category',
        '\n- [Category',
        content
    )

    # Remove standalone colon lines at end of file or before categories
    content = re.sub(
        r'\n:\s*\n*$',
        '\n',
        content
    )

    # Remove colon lines that appear before category lists
    content = re.sub(
        r'\n:\s*\n+(- \[)',
        r'\n\n\1',
        content
    )

    # 3. Clean up multiple blank lines (more than 2)
    content = re.sub(r'\n{4,}', '\n\n\n', content)

    # 4. Clean up trailing whitespace on lines
    lines = content.split('\n')
    lines = [line.rstrip() for line in lines]
    content = '\n'.join(lines)

    # Ensure file ends with single newline
    content = content.rstrip() + '\n'

    if content != original:
        if dry_run:
            print(f"Would clean: {filepath}")
            return True
        else:
            path.write_text(content)
            print(f"Cleaned: {filepath}")
            return True
    return False


def main():
    import argparse

    parser = argparse.ArgumentParser(description='Clean MediaWiki artifacts')
    parser.add_argument('--dry-run', action='store_true', help='Show what would be cleaned')
    parser.add_argument('--redirects', action='store_true', help='Only clean redirect notices')
    parser.add_argument('--colons', action='store_true', help='Only clean orphaned colons')
    parser.add_argument('files', nargs='*', help='Specific files to clean')

    args = parser.parse_args()

    wiki_dir = Path(__file__).parent / 'content' / 'wiki'

    if args.files:
        files = [Path(f) for f in args.files]
    else:
        files = list(wiki_dir.rglob('*.md'))

    cleaned = 0
    for f in files:
        if clean_file(f, dry_run=args.dry_run):
            cleaned += 1

    print(f"{'Would clean' if args.dry_run else 'Cleaned'}: {cleaned} files")


if __name__ == '__main__':
    main()
