#!/bin/bash

# function test_scan1() {
#     # 打开蓝牙
#     sudo systemctl start bluetooth

#     # 创建包含蓝牙控制台命令的临时文件
#     commands_file=$(mktemp)
#     echo "power on" >> "$commands_file"
#     echo "scan on" >> "$commands_file"

#     # 启动蓝牙控制台并执行命令
#     bluetoothctl < "$commands_file"

#     # 等待3秒以扫描附近蓝牙设备
#     sleep 3

#     # 获取扫描结果
#     devices=$(bluetoothctl << EOF
#     devices
#     EOF
#     )

#     # 关闭蓝牙控制台
#     bluetoothctl << EOF
#     scan off
#     exit
#     EOF

#     # 删除临时文件
#     rm "$commands_file"

#     # 处理扫描结果
#     while read -r line; do
#     if [[ $line =~ ^Device ]]; then
#     mac_address=$(echo $line | awk '{print $2}')
#     name=$(echo $line | awk '{print $3}')
#     rssi=$(echo $line | awk '{print $5}')
#     echo "MAC地址: $mac_address, 名称: $name, RSSI: $rssi dBm"
#     fi
#     done <<< "$devices"
# }

function test_scan2() {
    # 扫描蓝牙设备并获取扫描结果
    # devices=$(hcitool -i hci0 scan)

    cnt=0
    while [ $cnt -lt 3 ]
    do
        # 扫描蓝牙设备并获取扫描结果，设置超时时间
        devices=$(hcitool -i hci0 scan)
        if [ -n "$devices" ]; then
            break
        fi
        let cnt++
    done

    if [ $cnt -ge 3 ];then
        return 1
    fi

    echo $devices

    # 处理扫描结果
    while read -r line; do
    if [[ $line =~ ^[0-9A-Fa-f:]{17} ]]; then
        mac_address=$(echo $line | awk '{print $1}')
        name=$(echo $line | awk '{print $2}')
        # name=$(echo $line | cut -d' ' -f4-)
        echo "MAC地址: $mac_address, 名称: $name"
    fi
    done <<< "$devices"
}

test_scan2