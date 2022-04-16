# 概要
基本的に Linux 環境を構築する際に、毎回設定するのが面倒になる。  
だからとりあえず自分用のドットファイルをすぐに導入できるような仕組みが欲しかった。  


# ドットファイルの取得
```sh
curl https://raw.githubusercontent.com/Giganscudo-Duro/K-project/develop/99_DotFile/00_Linux/.vimrc -o ~/.vimrc
curl https://raw.githubusercontent.com/Giganscudo-Duro/K-project/develop/99_DotFile/00_Linux/.gvimrc -o ~/.gvimrc
curl https://raw.githubusercontent.com/Giganscudo-Duro/K-project/develop/99_DotFile/00_Linux/.screenrc -o ~/.screenrc
```



# CentOS の場合
```sh
sudo dnf install -y epel-release
sudo dnf --enablerepo=epel install -y screen
```


