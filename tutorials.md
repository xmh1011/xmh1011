## github-readme-stats

[github-readme-stats](https://github.com/anuraghazra/github-readme-stats/) 来源于 [anuraghazra](https://github.com/anuraghazra). 更多信息请[参考](https://github.com/anuraghazra/github-readme-stats/#readme).

## 定时执行

若您想要在 macOS 上每天定期执行一个 shell 脚本，您可以使用 macOS 的内置工具 cron 或者 launchd。

使用 cron，您可以按照以下步骤设置一个每天执行的定时任务：

打开终端应用程序。
输入 `crontab -e` 命令来编辑当前用户的 cron 任务。
如果您是第一次使用 cron，系统会要求您选择一个默认的文本编辑器。
在文本编辑器中，按照 cron 的语法添加一个新的任务，例如：
```
0 0 * * * /bin/bash /path/to/your/script.sh
```
这个示例中的任务将在每天的午夜（00:00）执行指定的脚本。
保存并关闭文本编辑器。
现在，您的脚本将每天定期执行。请确保替换示例中的 `/path/to/your/script.sh` 为您实际脚本的路径。

另一种方法是使用 launchd，这是 macOS 的更强大和灵活的任务调度系统。在这种情况下，您需要创建一个属性列表（plist）文件来描述任务的细节。以下是一个示例 plist 文件的内容：

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.example.dailyScript</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>/path/to/your/script.sh</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>StartCalendarInterval</key>
    <dict>
        <key>Hour</key>
        <integer>0</integer>
        <key>Minute</key>
        <integer>0</integer>
    </dict>
</dict>
</plist>
```
在上面的示例中，您需要将 `/path/to/your/script.sh` 替换为您实际脚本的路径。然后，将属性列表文件保存为 `com.example.dailyScript.plist` 或任何其他您喜欢的名称。

完成后，将 plist 文件复制到 `~/Library/LaunchAgents/` 目录中：

```bash
cp com.example.dailyScript.plist ~/Library/LaunchAgents/
```

最后，使用以下命令加载任务：

```bash
launchctl load ~/Library/LaunchAgents/com.example.dailyScript.plist
```

现在，您的脚本将每天定期执行。请注意，如果您需要对 plist 文件进行更改或删除任务，可以使用 launchctl unload 命令卸载任务。

请注意，以上提到的方法是基于 macOS 的先前版本，如果在最新的 macOS 版本上遇到问题，请参考 macOS 文档或开发者文档以获取更准确的信息。
