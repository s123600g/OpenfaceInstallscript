Ubuntu 14.04 or 16.04 安裝Openface應用
----------------------------------------------------------------------------------------------------------------------------------

OpenFaceInstallScript-20181118目錄結構：
----------------------------------------------------------------------------------------------------------------------------------
1.InstallOpenface(安裝Openface腳本)
2.DemoScript(測試運作腳本指令)

2018/11/18更新事項：
----------------------------------------------------------------------------------------------------------------------------------
1.更動所有安裝腳本的內容，修改腳本在運作上問題。

2.所有腳本的檔名日期均更改為20181118。

3.修改一些安裝步驟，增加二個安裝腳本(RunInstallTorch_20181118.sh、RunInstallTorch_luarocks_20181118.sh)。

4.更改DemoCommand內容，Demo1.txt、Demo2.txt、Demo3.txt。

5.修正"RunInstallpip_20181118.sh"腳本內容關於

sudo pip install scikit-learn  --修正為--> sudo pip install scikit-learn==0.18 #限定0.18版本。

6.更新注意事項說明。

7.更新安裝前條件說明。

8.更動資料夾內容架構。


2018/08/16更新事項：
-----------------------------------------------------------------------------------------------------------------------------------
1.增加一些安裝腳本指令註解說明.

2.修改更新注意事項說明.

3.修改安裝前條件說明.

3.重新整理安裝腳本內的指令.

4.更新 RunInstallpip_20180816.sh 內容
  + sudo pip install nolearn # for use nolearn.DBN
  
5.更新 RunInstallOpenCV_20180816.sh 內容
  - mkdir release
  + sudo mkdir release
  
6.更新 RunInstallOpenface_20180816.sh 內容
  + mkdir ~/data/
  + cd ~/data
  + git clone https://github.com/cmusatyalab/openface.git
  
#備註 "+" --> 增加 ，"-" --> 刪減

安裝前條件：
---------------------------------------------------------------------------------------------------------------------------------------
1.Ubuntu 安裝最低版本為14.04 LTS ，目前已測試過16.04 LTS 是可行，18.04 LTS目前只有測試過可以安裝尚未測試是否可運行。

2.如果是只使用CPU版本的話,不用管顯示卡部份，如果要使用顯示卡必須使用Nvidia顯示卡。

3.如果是要使用到GPU版本的話,下列安裝步驟執行之前要先做安裝顯示卡驅動和CUDA,如果是筆電須注意雙顯切換問題,要先測試好驅動穩定性和能夠切換到使用GPU而不是使用內顯。

4.如果顯示卡驅動和CUDA都裝好了，可以先測試在Nvidia-settings裡面看到有兩張顯卡資訊一張是內顯一張是外顯GPU,再來是Nvidia-smi裡面資訊能夠看到GPU正在運行中。

5.可在nvidia-settings裡面設定切換要使用Nvidia顯示卡或者Intel內顯。

6.如果要透過終端機切換Nvidia和內顯部份，可透過sudo prime-select nvidia(外顯) 或 sudo prime-select intel(內顯)

安裝步驟：
---------------------------------------------------------------------------------------------------------------------------------------
請透過終端機(Terminal)進行安裝，透過cd指另切換到腳本存在的目錄底下

本目錄為~/OpenFaceInstallScript-20181118，安裝腳本存在~/OpenFaceInstallScript-20181118/InstallOpenface
Ex:
$ cd ~/OpenFaceInstallScript-20181118/InstallOpenface



查看當前位置底下所有目錄檔案清單，透過"ls"
Ex:
$ ls



以Ubuntu14.04為例，假如要執行"RunInstallpip_20181118.sh"腳本，透過"sh"
Ex:
$ sudo sh RunInstallpip_20181118.sh



Step1.安裝相關前置套件與pip,安裝指令參考檔案 "RunInstallpip_20181118.sh"

Step2.安裝Opencv版本為2.4,安裝指令參考檔案 "RunInstallOpenCV_20181118.sh"

Step3.安裝dlib,安裝指令參考檔案 "RunInstalldlib_20181118.sh"

Step4-0.安裝Torch7,安裝指令參考檔案

Step4-1."RunInstallTorch_20181118.sh"

Step4-2."RunInstallTorch_luarocks_20181118.sh"

Step4-3.只有使用CPU，而未使用GPU情況-->"RunInstallTorch_CPU_20181118.sh"

Step4-4.有使用GPU情況-->"RunInstallTorch_GPU_20181118.sh"

Step5.安裝設定Openface,安裝指令參考檔案 "RunInstallOpenface_20181118.sh"
