#!/bin/bash
# Requires mermaid-cli to be installed (npm install -g @mermaid-js/mermaid-cli)
echo '{"args": ["--no-sandbox"]}' > /tmp/puppeteer-config.json

# Process language-specific diagrams
for lang in pt en es; do
  echo "Processing $lang diagrams..."
  mkdir -p "diagrams/images/$lang"

  for file in diagrams/mermaid/$lang/*.mmd; do
    if [ -f "$file" ]; then
      filename=$(basename -- "$file")
      extension="${filename##*.}"
      filename="${filename%.*}"
      echo "  Generating $filename.png for $lang..."
      npx -p @mermaid-js/mermaid-cli mmdc -i "diagrams/mermaid/$lang/$filename.mmd" -o "diagrams/images/$lang/$filename.png" -s 4 -b transparent -p /tmp/puppeteer-config.json
    fi
  done
done

echo "Done!"