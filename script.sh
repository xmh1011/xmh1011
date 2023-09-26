#!/bin/bash

# Markdown文件路径
file_path="./README.md"

# 获取当前日期时间
now=$(date +"%Y-%m-%d %H:%M:%S")

# 获取当前日期
date=$(date +"%Y-%m-%d")

# 计算倒数第六行的行号
line_number=$(($(wc -l < "$file_path") - 4))

# 标题
title="- 🗓️Updated at: "

# 拼接新的内容
new_content="$title$now"

# 更新倒数第六行的内容为当前日期时间
sed -i '' "${line_number}s/.*/$new_content/" "$file_path"

# 设置代理
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890

# 提交代码
git add .
git commit -s -m "feat: update README.md at $date"
git push origin main