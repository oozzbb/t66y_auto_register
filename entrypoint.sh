#!/bin/sh

# 启用错误检测
set -e

# 定义错误处理函数
error_handler () {
    echo "[$(date +'% Y-% m-% d % H:% M:% S')] [ERROR] 脚本在第 ${LINENO} 行发生错误"
    exit 1
}

# 捕获 ERR 信号，调用错误处理函数
trap 'error_handler' ERR

echo "Starting process..."
nohup python3 t66y_auto_register.py > app.log 2>&1 &
sleep 2
print_process_info
tail -f app.log
