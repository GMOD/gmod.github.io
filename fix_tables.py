#!/usr/bin/env python3
"""
Fix corrupted markdown tables where rows were merged into single lines.

Pattern to fix:
  | Header1 | Header2 |---|---| data1 | data2 | data3 | data4 |

Should become:
  | Header1 | Header2 |
  |---|---|
  | data1 | data2 |
  | data3 | data4 |
"""

import re
import sys
from pathlib import Path


def count_columns(separator_match):
    """Count columns in a separator row like |---|---|---|"""
    # Count the number of column separators (sequences of dashes between pipes)
    cols = re.findall(r'\|[-:]+', separator_match)
    return len(cols)


def fix_merged_table(line):
    """Fix a single line that contains a merged table."""

    # Pattern to find the separator row: |---|---| etc (with optional colons for alignment)
    separator_pattern = r'(\|[-:]+)+\|'

    match = re.search(separator_pattern, line)
    if not match:
        return line

    separator = match.group(0)
    sep_start = match.start()
    sep_end = match.end()

    # Check if separator is at the beginning of the line (not merged)
    before_sep = line[:sep_start].strip()
    if not before_sep:
        # Separator is at start, check if there's content after
        after_sep = line[sep_end:].strip()
        if not after_sep:
            return line  # Just a separator line, nothing to fix

    # Count columns from separator
    num_cols = count_columns(separator)

    # Split into: header | separator | data
    header = line[:sep_start].rstrip()
    data_part = line[sep_end:]

    # Build the fixed output
    result_lines = []

    # Add header if present
    if header:
        # Make sure header ends with |
        if not header.rstrip().endswith('|'):
            header = header.rstrip() + ' |'
        result_lines.append(header)

    # Add separator
    result_lines.append(separator)

    # Split data part into rows
    if data_part.strip():
        # The data part looks like: "  | cell1 | cell2 | cell3 | cell4 |  | cell1 | ..."
        # where the spaces before first | can represent an empty first cell

        # Split by |
        raw_cells = data_part.split('|')

        # Process cells
        # Split of "  | a | b | c |" gives ['  ', ' a ', ' b ', ' c ', '']
        # The '  ' before first | is the first cell (empty), and '' after last | is artifact
        cells = []
        for i, cell in enumerate(raw_cells):
            cell_stripped = cell.strip()
            # Skip the very last element if it's empty (artifact after trailing |)
            if i == len(raw_cells) - 1 and not cell_stripped:
                continue
            # Include all other cells, even empty ones
            cells.append(cell_stripped)

        # Group cells into rows based on column count
        row_cells = []
        for cell in cells:
            row_cells.append(cell)
            if len(row_cells) == num_cols:
                result_lines.append('| ' + ' | '.join(row_cells) + ' |')
                row_cells = []

        # Handle any remaining cells (incomplete row)
        if row_cells:
            # Pad with empty cells if needed
            while len(row_cells) < num_cols:
                row_cells.append('')
            result_lines.append('| ' + ' | '.join(row_cells) + ' |')

    return '\n'.join(result_lines)


def has_merged_table(line):
    """Check if a line contains a merged table (separator not at line start)."""
    # Look for separator pattern that's not at the start of the line
    # Pattern: some content followed by |---|
    match = re.search(r'[^\n]\|[-:]+[-:|\s]+\|[^-]', line)
    return bool(match)


def fix_file(filepath, dry_run=False):
    """Fix merged tables in a markdown file."""
    path = Path(filepath)
    if not path.exists():
        print(f"File not found: {filepath}")
        return False

    content = path.read_text()
    original_content = content

    lines = content.split('\n')
    fixed_lines = []
    changes_made = False

    for line in lines:
        if has_merged_table(line):
            fixed_line = fix_merged_table(line)
            if fixed_line != line:
                changes_made = True
                if dry_run:
                    print(f"Would fix in {filepath}:")
                    print(f"  Before: {line[:100]}...")
                    print(f"  After:  {fixed_line[:100]}...")
            fixed_lines.append(fixed_line)
        else:
            fixed_lines.append(line)

    if changes_made and not dry_run:
        new_content = '\n'.join(fixed_lines)
        path.write_text(new_content)
        print(f"Fixed: {filepath}")
        return True

    return changes_made


def find_files_with_merged_tables(directory):
    """Find all markdown files with merged tables."""
    files_with_issues = []

    for md_file in Path(directory).rglob('*.md'):
        content = md_file.read_text()
        for line in content.split('\n'):
            if has_merged_table(line):
                files_with_issues.append(str(md_file))
                break

    return files_with_issues


def main():
    import argparse

    parser = argparse.ArgumentParser(description='Fix merged markdown tables')
    parser.add_argument('--dry-run', action='store_true', help='Show what would be fixed without making changes')
    parser.add_argument('--find', action='store_true', help='Find files with merged tables')
    parser.add_argument('--fix-all', action='store_true', help='Fix all files in content/wiki')
    parser.add_argument('files', nargs='*', help='Specific files to fix')

    args = parser.parse_args()

    wiki_dir = Path(__file__).parent / 'content' / 'wiki'

    if args.find:
        print("Finding files with merged tables...")
        files = find_files_with_merged_tables(wiki_dir)
        print(f"Found {len(files)} files with merged tables:")
        for f in sorted(files):
            print(f"  {f}")
        return

    if args.fix_all:
        print("Finding and fixing all files with merged tables...")
        files = find_files_with_merged_tables(wiki_dir)
        fixed_count = 0
        for f in files:
            if fix_file(f, dry_run=args.dry_run):
                fixed_count += 1
        print(f"Fixed {fixed_count} files")
        return

    if args.files:
        for f in args.files:
            fix_file(f, dry_run=args.dry_run)
    else:
        parser.print_help()


if __name__ == '__main__':
    main()
