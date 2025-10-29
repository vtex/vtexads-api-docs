#!/bin/bash
# Requires mermaid-cli to be installed (npm install -g @mermaid-js/mermaid-cli)
echo '{"args": ["--no-sandbox"]}' > /tmp/puppeteer-config.json
for file in diagrams/mermaid/*.mmd; do
  filename=$(basename -- "$file")
  extension="${filename##*.}"
  filename="${filename%.*}"
  npx -p @mermaid-js/mermaid-cli mmdc -i "diagrams/mermaid/$filename.mmd" -o "diagrams/images/$filename.png" -s 4 -b transparent -p /tmp/puppeteer-config.json
done