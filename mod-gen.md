### 根据`resource`名称生成 `variable.tf`、`resource.tf`、`schema.json`、`input.json`

1、根据名称生成代码

`mod-gen -r huaweicloud_networking_secgroup_rule`

2、指定代码生成的目录

`mod-gen -r huaweicloud_networking_secgroup_rule -o ./output`

3、指定参数名称（默认是根据资源名称去掉huaweicloud_）

`mod-gen -r huaweicloud_networking_secgroup_rule -o ./output -p rules`

开发环境下载：

[linux_amd64.zip](http://pms.huaweicloud.plus/pms/static/linux_amd64.zip)

[windows_amd64.zip](http://pms.huaweicloud.plus/pms/static/windows_amd64.zip)



