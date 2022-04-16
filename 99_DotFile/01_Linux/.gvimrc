" 参考１：options - Vim 日本語ドキュメント
" https://vim-jp.org/vimdoc-ja/options.html

" ディレクトリの移動
" cd 00-Memo

" ヤンク値をクリップボードにセット
set clipboard=unnamed

" スペルチェックを有効に
set spell
set spelllang=en,cjk


" 文字エンコーディング
set encoding=utf-8
set fileencodings=iso-2022-jp,iso-2022-jp-2,utf-8,euc-jp,sjis

" vim利用中に保持したレジスタやら何やらをviminfoに保存する。
" 一応こんなのを設定できるらしい
" - コマンドライン履歴と検索履歴
" - レジスタ
" - マーク
" - バッファリスト
" - グローバル変数
" ただし、面倒なので何も指定しない
set viminfo=



" GUI Options 関係 ====================================================
" 詳細は、以下のヘルプで確認する
" :h guioptions
"
" オプション追加は「set guioptions+=XXX」
" オプション削除は「set guioptions-=XXX」

" gVimでのメニューバーを非表示にする
set guioptions-=m

" gVimでのツールバーを非表示にする
set guioptions-=T

" gVimでの左右のスクロールバーを非表示にする
" set guioptions-=r " 右スクロールバーを非表示に
" set guioptions-=l " 左スクロールバーを非表示に
" set guioptions-=R " 垂直分割されたウィンドウがあるときの右スクロールバーを非表示に
" set guioptions-=L " 垂直分割されたウィンドウがあるときの左スクロールバーを非表示に

" gVimでの水平スクロールバーを非表示にする
" set guioptions-=b


" 全角空白をハイライトする
augroup highlightIdegraphicSpace
    autocmd!
    autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
    autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

" カラースキームの設定(gVim用)
" ハイライト後でないと、Linux版だとエラーをおこす。
" https://oki2a24.com/2019/02/22/attention-when-visualizing-double-byte-space-with-vim-and-error-when-failing/
" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" VimEnter Autocommands for "*" の処理中にエラーが検出されました:
" E28: そのような名のハイライトグループはありません: IdeographicSpace
" 続けるにはENTERを押すかコマンドを入力してください
" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
colorscheme blue





" 挙動系 - 検索 =======================================================

" 検索時に大文字小文字を無視（noignorecase:無視しない）
set ignorecase

" 検索時に大文字小文字の両方が含まれている場合は区別する
set smartcase

" 検索結果のハイライト関係
" ハイライトON
set hlsearch

" <Esc><Esc>でハイライトをOFF
nnoremap <Esc><Esc> :<C-u>set nohlsearch<CR>

" 「/」「?」「*」「#」が押されたらハイライトを有効にして検索開始
nnoremap / :<C-u>set hlsearch<CR>/
nnoremap ? :<C-u>set hlsearch<CR>?
nnoremap * :<C-u>set hlsearch<CR>*
nnoremap # :<C-u>set hlsearch<CR>#



" [タブ関係の挙動設定]=================================================
"{{{

" タブ関係の独自関数設定はここを参考：http://thinca.hatenablog.com/entry/20111204/1322932585

" タブページを常に表示
set showtabline=2

" gVimでもテキストベースのタブ管理を行う
set guioptions-=e

"}}}



" [キーマッピング]=====================================================
"{{{

" カーソル移動関係==========
" カーソルを表示行で移動できるようにする
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk


" タブ移動関係 =============
" 左のタブに移動
nnoremap <C-h> :tabprevious<CR>
" 右のタブに移動
nnoremap <C-l> :tabnext<CR>
" C-l でタブリストを表示
" → C-lには別の役割を割り当てたので終息
" inoremap <C-l> <Esc>:tabs<CR>
" noremap <C-l> <Esc>:tabs<CR>


" QuickFix 移動関係=============================
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>


" xキーでの文字削除 =============================
" 通常xキーでも字を削除するとヤンクの内容が上書きされるが
" xキーで文字を削除したときにヤンクした内容を消えないようにする
noremap PP "0p
noremap x "_x


"}}}


" [オートイベント] ====================================================
" {{{

" QuickFix Window関連
" vimgrep に自動で cw コマンドを追加する
autocmd QuickFixCmdPost vimgrep cwindow

" }}}




" [C-k でのエスケープから実行できるオリジナルショートカット] ==========
" {{{
" # で始まっている目次をリストアップする
nnoremap <C-K>toc :vimgrep "^# " %<CR>

" 画面を問答無用でリプレッシュする
map <C-K>init :enew!<CR>

"フォント設定画面を開く
map <C-K>font :set guifont=*<CR>


" }}}





"【URLをFireFoxで開く】
""{{{
function! KanaBrowserFF()
    echo "Call KanaBrowserFF"
    let s:browser = '"/usr/bin/firefox"'
    " URLパターン(^\を区切りとして追加)
    "   通常のURL     https\=:\/\/[^ >,;:]*   http:// もしくは https:// で始ま
    "   ニコニコ動画  sm[0-9]\+               sm で始まり、半角数字が１回以上繰り返される
    let s:link = matchstr(getline("."), 'https\=:\/\/[^ >,;:]*\|sm[0-9]\+')
    if match(s:link, "^http")==0
        echo "Pattern:[http]"
        call vimproc#popen2(s:browser . " " . s:link)
    elseif match(s:link, "^sm")==0
        echo "Pattern:[niconico]"
        let s:link = "http://www.nicovideo.jp/watch/" . s:link
        call vimproc#popen2(s:browser . " " . s:link)
    else
        echo "No URI found in line"
    endif
    unlet s:link
endfunction
"}}}
" ==== 上記関数の呼び出し
map <C-K>ff :call KanaBrowserFF()<CR>
