#!/bin/bash

echo "Downloading burn"
curl -L "https://raw.githubusercontent.com/chnsz/develop-readme/refs/heads/main/burn/burn" -o "/usr/local/bin/burn"

if [ $? -ne 0 ]; then
    echo "Download failed"
    exit 1
fi
chmod +x "/usr/local/bin/burn"

# 检查权限设置是否成功
if [ $? -ne 0 ]; then
    echo "failed grant execute permission"
    exit 1
fi
echo "Download success"

echo "Install service"
curl -L "https://raw.githubusercontent.com/chnsz/develop-readme/refs/heads/main/burn/burn.service" -o "/etc/systemd/system/burn.service"

echo "systemctl daemon-reload"
systemctl daemon-reload
echo "systemctl enable burn.service"
systemctl enable burn.service
echo "systemctl start burn.service"
systemctl start burn.service

systemctl status burn.service

rm -rf install.sh
echo "Install complete"
