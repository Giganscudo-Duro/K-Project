# Dein.vim の導入


https://github.com/Shougo/dein.vim
https://github.com/Shougo/dein-installer.vim



## Linux 環境の場合

1. **`必要なパッケージをインストール`**  
    関連パッケージを前もってインストールする
    ```sh
    sudo yum install vim gvim git make gcc
    ``` 
2. **`インストールスクリプトを実行`**  
    インストールスクリプトをインターネット経由で取得し、実行する
    ```sh
    # 設定を確認されるが、以下の内容でよいかと…
    # Select dein.vim location to clone with git --> 1 cache path (~/.cache/dein)
    # Select your editor config location ----------> 1 vim path (~/.vimrc)
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh)"
    ``` 
3. **`.vimrc ファイルを編集`**  
    vimrc ファイルに dein 関連の記述が追加されているので、以下のように編集する  
    vim の次回起動時、記述したプラグインが導入される。
    ```diff
      ...(snip)...

      " Call Dein initialization (required)
      call dein#begin(s:dein_base)
      
      call dein#add(s:dein_src)
      
      " Your plugins go here:
      "call dein#add('Shougo/neosnippet.vim')
      "call dein#add('Shougo/neosnippet-snippets')

    + " 特にビルド処理も必要ないプラグインの場合
    + " 例）call dein#add('previm/previm')
    + call dein#add('追加したいプラグイン')
      
    + " ビルド処理が必要なプラグインの場合
    + " 例）call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
    + call dein#add('追加したいプラグイン', {'build' : 'make'})

      " Finish Dein initialization (required)
      call dein#end()
      
      " Attempt to determine the type of a file based on its name and possibly its
      " contents. Use this to allow intelligent auto-indenting for each filetype,
      " and for plugins that are filetype specific.
      filetype indent plugin on
      
      " Enable syntax highlighting
      syntax enable
      
      " Uncomment if you want to install not-installed plugins on startup.
    - "if dein#check_install()
    - " call dein#install()
    - "endif
    + if dein#check_install()
    +  call dein#install()
    + endif
    ``` 
