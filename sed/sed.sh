#!/bin/sh

text1="ctrl_interface=/var/run/wpa_supplicant"
text2="update_config=1"

sed -i "1i $text2" file.txt
sed -i "1i $text1" file.txt