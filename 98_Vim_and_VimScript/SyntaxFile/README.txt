# Linux の場合

1. ユーザーランタイムディレクトリを作成する。通常はオプション 'runtimepath' に示される最初のディレクトリを使用する。UNIXの例では:
        mkdir ~/.vim

2. "syntax" という名のディレクトリを作成する。UNIXでは:
        mkdir ~/.vim/syntax

3. Vimの構文ファイルを作成する。もしくはインターネットからダウンロードする。そのファイルはディレクトリsyntaxに置く。構文 "mine" の例では:
        :w ~/.vim/syntax/mine.vim

4. 最後に、.vimrc に以下の記述を追加する。

```txt
" [独自設定] ===========================================================
" {{{
" 独自のシンタックスハイライトを有効にする
au BufRead,BufNewFile *.txt set filetype=txt

" }}}
``` 







# WindowsGVim の場合


1. Vimの構文ファイルを作成する。もしくはインターネットからダウンロードする。そのファイルはディレクトリsyntaxに置く。構文 "mine" の例では:
        gnupack/app/vim/vim81/syntax/txt.vim

2. 最後に、.vimrc に以下の記述を追加する。

```txt
" [独自設定] ===========================================================
" {{{
" 独自のシンタックスハイライトを有効にする
au BufRead,BufNewFile *.txt set filetype=txt

" }}}
``` 
