#!/usr/bin/env python3
"""
Fix common broken link patterns in markdown files.

Main issues:
1. /mediawiki/index.php links (old MediaWiki links)
2. Case sensitivity issues (/wiki/news/ should be /wiki/News/)
3. Component links missing .1 suffix (/wiki/Galaxy should be /wiki/Galaxy.1)
4. Links to deleted Special: and Property: pages
"""

import re
import sys
from pathlib import Path

# Components that need .1 suffix (pages exist as Component.1.md)
COMPONENTS_NEEDING_SUFFIX = {
    'Apollo', 'Galaxy', 'CMap', 'JBrowse', 'GBrowse', 'MAKER', 'Tripal',
    'WebApollo', 'Pathway_Tools', 'GBrowse_syn', 'WebGBrowse', 'BLAST_Graphic_Viewer',
    'GO::TermFinder', 'Sybil', 'Flash_GViewer', 'Textpresso', 'XORT',
    'GMODTools', 'Modware', 'Table_Editor', 'LuceGene', 'Turnkey',
    'PubSearch', 'Argos', 'Caryoscope', 'SynView', 'SynBrowse', 'ISGA',
    'Community_Annotation_System', 'DIYA', 'BioDIG', 'SOBA', 'Cloud',
    'GBrowse_Configuration_HOWTO', 'Chado_Natural_Diversity_Module',
}


def fix_links(content):
    """Fix common broken link patterns."""
    original = content

    # 1. Remove /mediawiki/index.php links entirely or fix them
    # Pattern: [text](/mediawiki/index.php?...) -> remove or fix
    content = re.sub(
        r'\[([^\]]+)\]\(/mediawiki/index\.php[^)]*\)',
        r'\1',  # Just keep the text, remove the link
        content
    )

    # 2. Fix href="/mediawiki/index.php" in HTML
    content = re.sub(
        r'href="/mediawiki/index\.php[^"]*"',
        'href="#"',
        content
    )

    # 3. Fix case sensitivity for /wiki/news/ -> /wiki/News/
    content = re.sub(
        r'(/wiki/)news/',
        r'\1News/',
        content
    )

    # 4. Remove links to Special: pages
    # [text](/wiki/Special:...) or [text](/wiki/Special%3A...)
    content = re.sub(
        r'\[([^\]]+)\]\(/wiki/Special[:%][^)]+\)',
        r'\1',
        content
    )

    # 5. Remove links to Property: pages
    content = re.sub(
        r'\[([^\]]+)\]\(/wiki/Property[:%][^)]+\)',
        r'\1',
        content
    )

    # 6. Fix component links that need .1 suffix
    # Only fix if it's a link to the exact component name, not a subpage
    for comp in COMPONENTS_NEEDING_SUFFIX:
        # Match /wiki/Component) or /wiki/Component#anchor) or /wiki/Component "title")
        # But NOT /wiki/Component/subpage or /wiki/Component.1
        pattern = rf'(\(/wiki/{re.escape(comp)})([)#"\s])'
        replacement = rf'\g<1>.1\2'
        content = re.sub(pattern, replacement, content)

        # Also fix href="/wiki/Component" patterns
        pattern = rf'(href="/wiki/{re.escape(comp)})(["#])'
        replacement = rf'\g<1>.1\2'
        content = re.sub(pattern, replacement, content)

    # 7. Fix relative links that incorrectly include parent path
    # e.g., /wiki/SomePage/OtherPage where OtherPage should be /wiki/OtherPage
    # This is tricky - skip for now as it needs more analysis

    return content


def fix_file(filepath, dry_run=False):
    """Fix links in a file."""
    path = Path(filepath)
    content = path.read_text()
    fixed = fix_links(content)

    if fixed != content:
        if dry_run:
            print(f"Would fix: {filepath}")
            return True
        else:
            path.write_text(fixed)
            print(f"Fixed: {filepath}")
            return True
    return False


def main():
    import argparse

    parser = argparse.ArgumentParser(description='Fix broken links')
    parser.add_argument('--dry-run', action='store_true')
    parser.add_argument('files', nargs='*')

    args = parser.parse_args()

    wiki_dir = Path(__file__).parent / 'content' / 'wiki'

    if args.files:
        files = [Path(f) for f in args.files]
    else:
        files = list(wiki_dir.rglob('*.md'))

    fixed = 0
    for f in files:
        if fix_file(f, dry_run=args.dry_run):
            fixed += 1

    print(f"{'Would fix' if args.dry_run else 'Fixed'}: {fixed} files")


if __name__ == '__main__':
    main()
