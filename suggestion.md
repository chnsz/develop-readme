
## 1. go install 报错 

本案例主要在wsl环境下，在执行go install或者运行静态检查的时候，出现如下错误：

```bash
huawei@ecs-cheng:~/../terraform-provider-huaweicloud$ go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go: github.com/golangci/golangci-lint/cmd/golangci-lint@latest: module github.com/golangci/golangci-lint/cmd/golangci-lint: Get "https://goproxy.cn/github.com/golangci/golangci-lint/cmd/golangci-lint/@v/list": proxyconnect tcp: EOF
```
或者在运行静态检查时报错

```bash
huawei@ecs-cheng:~/.../terraform-provider-huaweicloud$ ./scripts/codecheck.sh ./huaweicloud/services/cpts

==> Checking for running environment...
    ==> Checking PATH...
    ==> Installing boyter/scc...
go: github.com/boyter/scc/v3@latest: module github.com/boyter/scc/v3: Get "https://goproxy.cn/github.com/boyter/scc/v3/@v/list": proxyconnect tcp: EOF
    ==> Installing misspell...
go: github.com/client9/misspell/cmd/misspell@latest: module github.com/client9/misspell/cmd/misspell: Get "https://goproxy.cn/github.com/client9/misspell/cmd/misspell/@v/list": proxyconnect tcp: EOF
    ==> Installing gocyclo...
go: github.com/fzipp/gocyclo/cmd/gocyclo@latest: module github.com/fzipp/gocyclo/cmd/gocyclo: Get "https://goproxy.cn/github.com/fzipp/gocyclo/cmd/gocyclo/@v/list": proxyconnect tcp: EOF

==> Applying patch...
error: patch failed: huaweicloud/utils/fmtp/errors.go:7
error: huaweicloud/utils/fmtp/errors.go: patch does not apply
error: patch failed: huaweicloud/utils/logp/log.go:6
error: huaweicloud/utils/logp/log.go: patch does not apply
warning: cannot apply patch
```

原因：go的代理与系统的代理冲突导致
解决办法：临时去掉系统中的代理

执行如下命令，可以去除代理
```bash
unset http_proxy
unset https_proxy
```

需要重新配置代理时，请执行：

```bash
source /etc/profile
```

校验代理是否重新配置正确，执行如下脚本：

```bash
huawei@ecs-cheng:~$ env | grep proxy
no_proxy=localhost,127.0.0.1,192.168.0.0/16,goproxy.cn
https_proxy=https://192.168.0.66:9090
http_proxy=http://192.168.0.66:9090
```

能够看到http_proxy、https_proxy对应的地址即可。

## 2. 为Git配置代理 [必须]
git 客户端默认不走系统的代理，需要单独配置

```bash
git config --global http.proxy http://192.168.0.66:9090
git config --global https.proxy https://192.168.0.66:9090
```

分别在window和wsl中都执行。

## 3. 禁用Git换行符转换 [必须]

自动转行换行符可能会导致代码运行问题，建议关闭。
分别在window和wsl中执行如下命令：
```bash
git config --global core.autocrlf false
```

## 4. 安装gcc [必须]

在运行单元测试或者构建项目时，以来gcc插件，请执行如下命令安装：

```bash
sudo apt update
sudp apt install -y gcc
```
