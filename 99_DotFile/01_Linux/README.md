# 概要
基本的に Linux 環境を構築する際に、毎回設定するのが面倒になる。  
だからとりあえず自分用のドットファイルをすぐに導入できるような仕組みが欲しかった。  


# ドットファイルの取得
- 基本
    ```sh
    curl https://raw.githubusercontent.com/Giganscudo-Duro/K-project/develop/99_DotFile/01_Linux/.vimrc -o ~/.vimrc
    curl https://raw.githubusercontent.com/Giganscudo-Duro/K-project/develop/99_DotFile/01_Linux/.screenrc -o ~/.screenrc
    ```
- gVimも追加する場合
    ```sh
    curl https://raw.githubusercontent.com/Giganscudo-Duro/K-project/develop/99_DotFile/01_Linux/.gvimrc -o ~/.gvimrc
    ``` 


# CentOS の場合
CentOSの場合は、epelリポジトリを有効にしておく必要がある。
```sh
sudo dnf install -y epel-release
sudo dnf --enablerepo=epel install -y screen
```


