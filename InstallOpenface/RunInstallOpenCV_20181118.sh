# !/bin/bash
PATH=/sbin:/bin:/usr/bin

echo "安裝OpenCV."

sudo apt-get install -y build-essential
sudo apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
sudo apt-get install -y libxvidcore-dev libx264-dev
sudo apt-get install -y cmake3
sudo apt-get update	

#請注意/usr是屬於root權限的目錄
cd /usr/src

echo "切換到/usr/src目錄."

sleep 1s

echo ""
echo "下載OpenCV套件包."

#下載OpenCV套件包，透過git clone指令
sudo git clone https://github.com/opencv/opencv.git

#https://github.com/opencv/opencv  --> OpenCV GitHub

sleep 1s 
echo ""
echo "切換到/usr/src/opencv目錄."
#切換到/usr/src/opencv
cd /usr/src/opencv

sleep 1s
echo ""
echo "在/usr/src/opencv目錄下建立release目錄."
#在/usr/src/opencv建立release目錄
sudo mkdir release

# 切換到release目錄，請注意當前目錄是否在/usr/src/opencv底下
cd release

sleep 1s
echo ""
echo "開始安裝設定OpenCV......"

sudo cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
sudo make  -j8  
sudo make  install 

pkg-config --modversion opencv

cd ~/OpenFaceInstallScript-20181118/InstallOpenface
