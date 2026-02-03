#!/bin/bash
# Add front matter to all markdown files in content/wiki/

find content/wiki -name "*.md" -type f | while read -r f; do
  if ! head -1 "$f" | grep -q '^---'; then
    # Extract title from first heading or use filename
    title=$(grep -m1 '^# ' "$f" | sed 's/^# //' | sed 's/<[^>]*>//g')
    if [ -z "$title" ]; then
      title=$(basename "$f" .md | tr '_' ' ')
    fi
    # Escape quotes in title
    title=$(echo "$title" | sed 's/"/\\"/g')
    tmp=$(mktemp)
    echo "---" > "$tmp"
    echo "title: \"$title\"" >> "$tmp"
    echo "---" >> "$tmp"
    cat "$f" >> "$tmp"
    mv "$tmp" "$f"
  fi
done
