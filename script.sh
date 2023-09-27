#!/bin/bash

file_path="./README.md"

now=$(date +"%Y-%m-%d %H:%M:%S")

date=$(date +"%Y-%m-%d")

line_number=$(($(wc -l < "$file_path") - 4))

title="- 🗓 Updated at: "

new_content="$title$now"

sed -i '' "${line_number}s/.*/$new_content/" "$file_path"

export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890

git pull origin main
git add .
git commit -s -m "feat: update README.md at $date"
git push origin main -f

command_to_execute="/bin/bash /Users/xiaominghao/code/xmh1011/script.sh"

command_to_execute >> /Users/xiaominghao/code/xmh1011/log.txt 2>&1