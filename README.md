# Ubuntu 14.04 or 16.04 安裝Openface應用
本文是安裝Openface實戰筆記，目前有測試在Ubuntu14.04與16.04下使用 。 <
[Openface GitHub](https://github.com/cmusatyalab/openface.git)

OpenFaceInstallScript-20181118目錄結構：
----------------------------------------------------------------------------------------------------------------------------------
1.  InstallOpenface(安裝Openface腳本)

2.  DemoScript(測試運作指令)

2018/11/18更新事項：
----------------------------------------------------------------------------------------------------------------------------------
1.  更動所有安裝腳本的內容，修改腳本在運作上問題。

2.  所有腳本的檔名日期均更改為20181118。

3.  修改一些安裝步驟，增加二個安裝腳本(RunInstallTorch_20181118.sh、RunInstallTorch_luarocks_20181118.sh)。

4.  更改DemoCommand內容，Demo1.txt、Demo2.txt、Demo3.txt。

5.  修正"RunInstallpip_20181118.sh"腳本內容關於
    > sudo pip install scikit-learn  --修正為--> sudo pip install scikit-learn==0.18 #限定0.18版本。

6.  更新注意事項說明。

7.  更新安裝前條件說明。

8.  更動資料夾內容架構。


2018/08/16更新事項：
-----------------------------------------------------------------------------------------------------------------------------------
1.  增加一些安裝腳本指令註解說明.

2.  修改更新注意事項說明.

3.  修改安裝前條件說明.

3.  重新整理安裝腳本內的指令.

4.  更新 RunInstallpip_20180816.sh 內容
    增加 sudo pip install nolearn # for use nolearn.DBN
  
5.  更新 RunInstallOpenCV_20180816.sh 內容
    刪減 mkdir release
    增加 sudo mkdir release
  
6.  更新 RunInstallOpenface_20180816.sh 內容
    增加 mkdir ~/data/
    增加 cd ~/data
    增加 git clone https://github.com/cmusatyalab/openface.git
    

安裝前條件：
---------------------------------------------------------------------------------------------------------------------------------------
1.  Ubuntu 安裝最低版本為14.04 LTS ，目前已測試過16.04 LTS 是可行，18.04 LTS目前只有測試過可以安裝尚未測試是否可運行。

2.  如果是只使用CPU版本的話,不用管顯示卡部份，如果要使用顯示卡必須使用Nvidia顯示卡。

3.  如果是要使用到GPU版本的話,下列安裝步驟執行之前要先做安裝顯示卡驅動和CUDA,如果是筆電須注意雙顯切換問題,要先測試好驅動穩定性和能夠切換到使用GPU而不是使用內顯。

4.  如果顯示卡驅動和CUDA都裝好了，可以先測試在Nvidia-settings裡面看到有兩張顯卡資訊一張是內顯一張是外顯GPU,再來是Nvidia-smi裡面資訊能夠看到GPU正在運行中。

5.  可在nvidia-settings裡面設定切換要使用Nvidia顯示卡或者Intel內顯。

6.  如果要透過終端機切換Nvidia和內顯部份，可透過sudo prime-select nvidia(外顯) 或 sudo prime-select intel(內顯)

安裝步驟：
---------------------------------------------------------------------------------------------------------------------------------------
請透過終端機(Terminal)進行安裝，透過cd指另切換到腳本存在的目錄底下

本目錄為~/OpenFaceInstallScript-20181118，安裝腳本存在~/OpenFaceInstallScript-20181118/InstallOpenface
> $ cd ~/OpenFaceInstallScript-20181118/InstallOpenface



查看當前位置底下所有目錄檔案清單，透過"ls"
> $ ls


以Ubuntu14.04為例，假如要執行"RunInstallpip_20181118.sh"腳本，透過"sh"
> $ sudo sh RunInstallpip_20181118.sh



Step1.安裝相關前置套件與pip,安裝指令參考檔案 
> sudo sh RunInstallpip_20181118.sh

Step2.安裝Opencv版本為2.4,安裝指令參考檔案 
> sudo sh RunInstallOpenCV_20181118.sh

Step3.安裝dlib,安裝指令參考檔案 
> sudo sh RunInstalldlib_20181118.sh

Step4-0.安裝Torch,安裝指令參考檔案

Step4-1.
> sudo sh RunInstallTorch_20181118.sh

Step4-2.
> sudo sh RunInstallTorch_luarocks_20181118.sh"

Step4-3.只有使用CPU，而未使用GPU情況
> sudo sh RunInstallTorch_CPU_20181118.sh

Step4-4.有使用GPU情況
> sudo sh RunInstallTorch_GPU_20181118.sh

Step5.安裝設定Openface,安裝指令參考檔案
> sudo sh RunInstallOpenface_20181118.sh


---------------------------------------------------------------------------------------------------------------------------------------
# Demo1測試:
> python ~/src/data/openface/demos/compare.py ~/src/data/openface/images/examples/{lennon*,clapton*}


# Demo2測試:
> python ~/src/data/openface/demos/classifier.py  infer ~/src/data/openface/models/openface/celeb-classifier.nn4.small2.v1.pkl ~/src/data/openface/images/examples/carell.jpg


# Demo3測試:
此Demo必須要在openface裡面建立2個資料夾，分別是"training-images"、"test-images"。

測試範例圖片在openfae/images/examples。


在training-images目錄內，每一個人的臉部圖像都必須要放在對應的識別名稱資料夾內，例如：clapton-2.jpg放置在training-images/clapton-2裡面
如果training-images目錄內都只放置圖片單檔，在執行到# Generate Representations 提取特徵 階段時會出現錯誤如下：

running "find" on each class directory, and concatenate all those filenames into a single file containing all image paths for a given class	
now combine all the files to a single large file	
load the large concatenated list of sample paths to self.imagePath	
/home/ubuntu/src/torch/install/bin/luajit: /home/ubuntu/src/data/openface/batch-represent/dataset.lua:193: Could not find any image file in the given input paths


Demo3測試1-影像檢測和校準

> python ~/src/data/openface/util/align-dlib.py  ~/src/data/openface/training-images/ align outerEyesAndNose ~/src/data/openface/aligned-images/ --size 96

Demo3測試2-提取特徵

> ~/src/data/openface/batch-represent/main.lua -outDir ~/src/data/openface/generated-embeddings/ -data ~/src/data/openface/aligned-images

Demo3測試3-建立訓練分類模型

> python ~/src/data/openface/demos/classifier.py train ~/src/data/openface/generated-embeddings/

Demo3測試4-Face detection 臉部偵測

> python ~/src/data/openface/demos/classifier.py infer ~/src/data/openface/generated-embeddings/classifier.pkl ~/src/data/openface/test-images/clapton-1.jpg

# 注意事項：
1.  安裝前請先注意套件來源庫有設為主要伺服器(main server)，不管是14.04或16.04都需要去檢查，16.04如果裝的是繁體中文預設會是臺灣伺服器,這樣會在第一步驟安裝時候就會發生錯誤,錯誤問題為依賴關係問題,訊息為"E:無法修正錯誤問題,因為您保留了損壞套件" 。

2.  請按照上述順序依序安裝,請透過Terminal下執行腳本方式運行,如果用腳本方式在運作中會出問題,代表有些指令不適合用腳本方式執行，請注意錯誤訊息是指什麼，再來更改腳本內容。

3.  請注意好各套件安裝是否在家目錄或Root根目錄，如果路徑是'~/'開頭代表是在家目錄底下，如果路徑是'/'開頭代表是在Root根目錄底下。

4.  有些安裝程序是在Root根目錄底下執行，必須要在指令開頭加上"sudo"這點必須注意。

5.  如果有看到指令後面有空一行然後加上"-y",代表執行這指令時會問你是否同意繼續,我們給它加上這參數用意是讓它自動繼續執行下去預設是同意。

6.  當安裝完之後請記得要修改sklearn參數有label.py和test_label.py這兩個檔案有要修改部份,在fix_sklearn目錄中有修改說明文件"fixcontent" 裡面有說明要改那一部份參數,"+"代表增加這一行,"-"代表拿掉這一行,此動作必須要做不然後面運行程式時候在sklearn部份會出問題。

7.  "RunInstalldlib_20181118.sh"安裝腳本需要用到"dlib-18.16.tar.bz2"檔案，預設在installOpenface目錄內會有，如果沒有此檔案請到 https://sourceforge.net/projects/boost/files/boost/1.62.0/ 中去下載。

8.  安裝完Torch時，請在終端機測試輸入"th"是否能夠正常進入Torch模式，如果不行代表安裝過程設定有問題。

9.  請注意classifier.py內 from sklearn.lda import LDA 已經不可用，新版本改為下列方式
    > from sklearn.discriminant_analysis import LinearDiscriminantAnalysis as LDA

  如有需要使用請必須要更改，否則運行時會出現錯誤

12. 關於Torch安裝部分，請注意在"RunInstallTorch_20181118.sh"腳本中
    #透過Git指令 > git clone 'URL' < 下載 GitHub 上的Torch 完整安裝包，並安裝Torch
    > sudo git clone https://github.com/torch/distro.git ~/src/torch --recursive
    > cd ~/src/torch
    > sudo bash install-deps
    > sudo ./install.sh   <--此行執行安裝完畢後，會詢問是否要加入Torch到環境變數去，如下:

    >>Do you want to automatically prepend the Torch install location
    to PATH and LD_LIBRARY_PATH in your /home/ubuntu/.bashrc? (yes/no)
    [yes] >>> 
    yes  <---請務必要輸入yes，否則系統會抓不到Torch

    輸入完畢後可在終端機輸入，使Torch剛剛設置的環境變數生效
    > source ~/.bashrc

    如何測試Torch可正常被系統辨識抓到?
    在終端機輸入"th"，如果設定都正常，就會進入Torch命令模式。

    如果終端機輸入"th"，卻沒有正常出現進入Torch命令模式，解決辦法如下：
    進入到你下載的torch目錄內，會看到"install-deps"、"install.sh"
    在終端機重新執行安裝程序，執行順序是
    > 1. sudo bash install-deps
    > 2. sudo ./install.sh

    當執行第二個時，請注意是否有出現詢問是否要加入Torch到環境變數，如上所示。

    查看系統環境變數，可在"~/.bashrc"內觀看
    會看到最後一行出現". /home/ubuntu/src/torch/install/bin/torch-activate" 。

13. 請注意在Ubuntu14.04在終端機執行腳本方式是透過"sh"來進行(Ex:" sudo sh RunInstallTorch_GPU_20181118.sh ")，16.04可以用"."來取代"sh"進行。

14. 關於Python的scikit-learn套件，有限定版本要求，在"RunInstallpip_20181118.sh"腳本中安裝指令已固定要求安裝版本為0.18版，0.20版本或低於0.18版本都會出問題，請注意一定要0.18版本。

16. 本專案腳本在安裝時，會自動在家目錄底下建立一個"src"目錄，裡面會放置"dlib-18.16"、"torch"、"data"內放置"openface"，總共會有三個目錄資料，不管是運作還是安裝都會需要用到，請勿隨意更動。
