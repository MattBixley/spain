#!/bin/bash
# Auto-generates _instagram_photos.qmd from files in instagram/
# Run as a Quarto pre-render script — no R or Python required.

INSTAGRAM_DIR="instagram"
OUTPUT="_instagram_photos.qmd"

{
  echo '::: {.insta-grid}'
  echo ''

  files=$(find "$INSTAGRAM_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) -printf '%T@ %p\n' | sort -rn | awk '{print $2}')

  if [ -z "$files" ]; then
    echo '*No photos yet — drop images into `instagram/` and re-render.*'
  else
    for f in $files; do
      filename=$(basename "$f")
      caption="${filename%.*}"
      echo "![${caption}](instagram/${filename}){group=\"insta\"}"
      echo ''
    done
  fi

  echo ':::'
} > "$OUTPUT"
