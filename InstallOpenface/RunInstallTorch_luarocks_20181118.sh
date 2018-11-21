# !/bin/bash
PATH=/sbin:/bin:/usr/bin

echo "安裝luarocks."

#安裝luarocks
sudo apt-get install -y luarocks

echo "設定Torch目錄權限."
#賦予安裝再家目錄底下的torch目錄root權限
sudo chmod -R 777 ~/src/torch
