# !/bin/bash
PATH=/sbin:/bin:/usr/bin

echo "安裝Openface."

#建立data目錄
mkdir ~/src/data/

#切換到data目錄
cd ~/src/data

#如果沒有openface套件資料夾就透過git clone去下載，如果有就搬移到~/data目錄底下
git clone https://github.com/cmusatyalab/openface.git

#https://github.com/cmusatyalab/openface  --> OpenFace GitHub

#如果已經有openface套件資料夾就手動搬移過去~/data目錄或者透過mv指令

#切換到~/data/openface/目錄底下
cd ~/src/data/openface/

# setup install openface
sudo python setup.py install

# get model 
sudo ./models/get-models.sh

echo "Openface目錄位置：~/src/data/Openface"

cd ~/OpenFaceInstallScript-20181118/installOpenface
