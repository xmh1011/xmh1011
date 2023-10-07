#!/bin/bash

file_path="/Users/xiaominghao/code/xmh1011"

readme_path="$file_path/README.md"

log_path="$file_path/log.txt"

now=$(date +"%Y-%m-%d %H:%M:%S")

date=$(date +"%Y-%m-%d")

line_number=$(($(wc -l < "$readme_path") - 4))

title="- 🗓 Updated at: "

new_content="$title$now"

sed -i '' "${line_number}s/.*/$new_content/" "$readme_path"

cd $file_path

echo "success: $now" >> "$log_path"

git add .
git commit -s -m "feat: update README.md at $date"
git push origin main -f