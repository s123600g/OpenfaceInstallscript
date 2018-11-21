# !/bin/bash
PATH=/sbin:/bin:/usr/bin

echo "下載Torch安裝包."
#透過Git指令 > git clone 'URL' < 下載 GitHub 上的Torch 完整安裝包，並安裝Torch
sudo git clone https://github.com/torch/distro.git ~/src/torch --recursive
cd ~/src/torch
sudo bash install-deps
sudo ./install.sh


