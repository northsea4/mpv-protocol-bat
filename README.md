# MPV Protocol Handler for Windows

这是一个 Windows 下的 MPV 协议处理程序，支持通过点击 `mpv://` 链接来用 MPV 播放视频。

## 功能特性

- 支持标准格式：`mpv://http://example.com/video.mp4`
- 支持 Chrome 130+ 格式（自动修复）：`mpv://http//example.com/video.mp4`

## 安装方式

下载项目压缩包 [`mpv-protocol-bat.zip`](https://github.com/northsea4/mpv-protocol-bat/archive/refs/heads/main.zip)。

1. 解压后将里面的 `bat` 文件放置到某个目录下，如 `D:\mpv-protocol-bat`。
2. 以管理员身份运行 `mpv-protocol-register.bat`

## 卸载
以管理员身份运行 `mpv-protocol-deregister.bat`

## 故障排除

如果遇到问题：

1. 确保以管理员身份运行注册脚本。
2. 检查 MPV 是否已正确安装，且 `mpv` 命令是否全局可用。