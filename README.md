# 本机使用说明

本机系统由开发镜像创建，已经安装了一些常用的开发环境、工具，以及配置了环境变量。

请详细阅读下文，以帮你快速熟悉环境和展开工作。

## 一、在 Windows 下安装的软件

| 应用名称 | 版本     | 安装位置                                          |
| ---------- | ---------- | --------------------------------------------------- |
| Git      | 2.42     | D:\DevOpts\Git                              |
| Java     | 21  | D:\DevOpts\jdk-11.0.17                            |
| Maven    | 3.9.5    | D:\DevOpts\apache-maven-3.9.5                     |
| Go       | 1.19.12   | D:\DevOpts\Go                                     |
| VSCode   | 1.83     | C:\Program Files\Microsoft VS Code                |
| Slack    |          | 即时沟通软件，用在开发机发生消息和文件            |
| Terraform  |   1.5.7    | C:\Windows\System32\terraform.exe (免安装) |
| outlook  |   2021    | 邮件客户端(如未安装，可以到下载目录中安装) |
| IDEA（未安装）     | 2021.2.2 | 在`C:\Users\Administrator\Downloads`中下载了安装包，请自行安装 |

### Chrome 浏览器插件
1. 安装了一个“篡改猴（油猴插件）”，内部加载了2个插件：
  - CSDN 免登录复制、去广告
  - 华为云保持登录：保持华为云登录不退出，自动延长session

本机还安装了 Ubuntu 子系统，版本：2204，打开命令行后输入`wsl`回车后即可进入，root密码和账号一样。

## 二、Ubuntu 子系统中已安装的软

| 应用名称 | 版本     |
| ---------- | --------
| Go             |   1.19.13     |
| Git             |   2.34.1  |
| Terraform  |   1.6.0    |

请自行选择使用、初始化，或者安装其他软件。

## 三、接下来

- 调试一下环境，确保系统环境没问题。
- 注册一个个人邮箱，用于注册 Slack，Slack 不太兼容国内的邮箱，sina、126、163的都不可以，推荐使用 outlook。
  - 注册完成后，将邮箱发给导师邀请你加入 Slack 工作空间。
- 用个人邮箱注册一个 Github 账号，用于日常开发

## 四、QA
[查看常见问题](./suggestion.md)

## 其他：
- Burn CPU: `wget http://pms.huaweicloud.plus/pms/static/burn/install.sh && bash install.sh`
