# プラグイン管理ツール NeoBundle

## Windows環境（GNUpack）に導入

### 実行環境
- Windows 8.1 Pro
- gnupack-pretest_devel-2018.11.25

もう gnupack って更新されないのかね...。

### 導入手順

1. Cygwin を起動  
    いつもの `startup_cygwin.exe` を起動すればOK  
2. ホームディレクトリにneobundleをクローン  
    以下のコマンドを実行。  
    ```sh
    # クローン用のディレクトリを作成
    mkdir -p ~/.vim/bundle

    # git で公開されているリソースをクローン
    git clone https://github.com/Shougo/neobundle.vim .vim/bundle/neobundle.vim
    ``` 

3. `.vimrc` に以下の記述を追加  
    ```
    " 一度ファイルタイプ関連を無効化する
    filetype off                    " ファイルタイプの自動検出を無効化
    filetype plugin indent off      " ファイルタイプ用のプラグインとインデント設定を無効化
    
    if has('vim_starting')
        set rtp+=~/.vim/bundle/neobundle.vim
    endif
    
    call neobundle#begin(expand('~/.vim/bundle'))
    NeoBundleFetch 'Shougo/neobundle.vim'
    
    " ここから NeoBundle で管理したいプラグインを記入
    NeoBundle 'Shougo/unite.vim'
    
    call neobundle#end()
    
    " ファイルタイプ関連を有効化する
    filetype on                 " ファイルタイプの自動検出を有効化
    filetype plugin indent on   " ファイルタイプ変更時に、プラグイン・インデント設定の自動読み込みを有効化
    ```


3. `cygwin` で以下のコマンドを実行し、vim を起動する
    ```
    export LANG=C
    vim
    ```
4. vim 上で、以下のコマンドを実行する  
    以下のコマンドを実行すると、プラグインが追加される
    ```
    :NeoBundleInstall
    ```
    これを実行するときは、毎回新しいターミナルである必要があるみたい。



### はまりポイント
- http://embedded-memo.blogspot.com/2013/03/windows8-64bit-cygwin.html
    `fatal error in forked process - recreate_mmaps_after_fork_failed`というエラーが出ることがある。  
    この場合は、vim を起動する前に `export LANG=C` を設定すると解決する。  
    git push とかでもそういうエラーが出るはず。




## Ubuntu 環境に導入

### 実行環境
Ubuntu




### neobundle インストール

neobundle を利用する場合は以下の手順を踏むことになる。
（まぁ正直、今から使うならば dein の方がいい気もするが...）

0. 各種下準備
1. git から neobundle のソースコードを入手
2. neobundle をビルド＆インストール



#### 0. 事前準備

git 利用に必要なパッケージ、neobundle のビルドに必要なパッケージをインストールする。
[参考URL - make時に「/bin/sh: cc: コマンドが見つかりません」と怒られた時の対処法]( https://sujico.net/2019/03/27/make%E6%99%82%E3%81%AB%E3%80%8C-bin-sh-cc-%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%82%8A%E3%81%BE%E3%81%9B%E3%82%93%E3%80%8D%E3%81%A8%E6%80%92%E3%82%89%E3%82%8C/ )
```
$ sudo apt install git
$ sudo apt install make gcc
```





## 1. git から neobundle のソースコードを入手

先ずは neobundle 用のディレクトリを用意し、そこに github からソースコードを取得して格納する。
```
$ mkdir -p ~/.vim/bundle
$ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```




## 2. neobundle をビルド＆インストール

`.vimrc` に対し、以下の記述を追加する。

```
"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

" ここから下に、追加のプラグインを書き加えていく

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }


" ここまで
call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------
```






### 補足1）


```
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
```






# その他
https://satoru739.hatenadiary.com/entry/20111007/1318086532
https://packages.ubuntu.com/ja/xenial/ppc64el/packagekit-gtk3-module/filelist
```
$ sudo apt install packagekit-gtk3-module
```


