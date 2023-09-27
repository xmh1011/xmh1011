#!/bin/bash

file_path="./README.md"

now=$(date +"%Y-%m-%d %H:%M:%S")

date=$(date +"%Y-%m-%d")

line_number=$(($(wc -l < "$file_path") - 4))

title="- 🗓 Updated at: "

new_content="$title$now"

sed -i '' "${line_number}s/.*/$new_content/" "$file_path"

git add .
git commit -s -m "feat: update README.md at $date"
git push origin main -f

echo "success: $now" >> log.txt