- [nnoremap で設定した コマンドが Netrwのバッファ上で有効にならない]( https://github.com/vim-jp/issues/issues/1221 )



# 理由
NETRW起動時に、「NETRW用のコマンドマッピングを、vimrcに設定したマッピングに上書きしてしまう」が原因。
対処としては、以下のどれかを選択するしかない。
- NETRW に負けないよう設定する
- NETRW の該当コマンドマッピングを無効化する


# 確認方法
今回は、`tabnext` のショートカットとして設定した `<C-l>` が全然効かなかったことが始まりなので、それを用いて確認する。  

Vim を起動して、以下のコマンドを実行する。
```sh
:verbose nmap <C-l>
```
実際に実行すると、以下の情報が表示される。  
```sh
n  <C-L>       * :tabnext<CR>
        最後にセットしたスクリプト: ~/.vimrc 行 117
続けるにはENTERを押すかコマンドを入力してください
```
確かに、vimrc に設定したコマンドマッピングが有効になっていることがわかる。  


で、今度は NETRW を起動した状態で、実行してみる。  
```sh
n  <C-L>        @<Plug>NetrwRefresh
        最後にセットしたスクリプト: /usr/share/vim/vim82/autoload/netrw.vim 行 6475
n  <C-L>       * :tabnext<CR>
        最後にセットしたスクリプト: ~/.vimrc 行 117
続けるにはENTERを押すかコマンドを入力してください
```

これは、vimrc に設定したコマンドを上書きするカタチで、上書きされている事がわかる。


# 解決策

今回は `/usr/share/vim/vim82/autoload/netrw.vim` を書き換えて、該当コマンドマッピングを無効化した。









