" [基本設定] ===========================================================
" {{{

" 折り畳みを有効に {{{XXXXX}}}
set foldmethod=marker

" vimによる自動改行を止める
set tw=0

" tab 数を4文字で
set tabstop=4

" 自動改行を有効に
set autoindent

" }}}


" [表示系] =============================================================
" {{{

" 行番号を表示
set nu
" set nonu

" カーソルラインの表示
set cursorline

" 現在の行を強調表示（縦）
" set cursorcolumn

" バッファ中の隠れているTabを表示する
" 行末の隠れた半角スペースを表示する
set list listchars=tab:>-,trail:_

" カーソルを点滅させない
set guicursor=a:blinkon0

" 対応するかっこを強調表示
set showmatch

" 全角のスペースをハイライト
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" 通常vimでは 以下のカラースキームを利用する
colorscheme darkblue

" 要プラグイン
" {{{
" インデント可視化プラグインを有効に
" let g:indentLine_color_term =239
" let g:indentLine_color_gui = '#708090'
" " let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_char = '¦'

" }}}


" }}}


" [キーマッピング] =====================================================
" {{{

" カーソルを表示行で移動する
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" タブライン移動関係
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>

" C-l でタブリストを表示
" → C-lには別の役割を割り当てたので終息
" inoremap <C-l> <Esc>:tabs<CR>
" noremap <C-l> <Esc>:tabs<CR>

" QuickFix 移動関係
" 基本
" nnoremap <C-n> :cnext<CR>
" nnoremap <C-p> :cprevious<CR>
" 応用：上記に移動後に画面中心に移動するを追加
nnoremap <C-n> :cnext<CR>zz
nnoremap <C-p> :cprevious<CR>zz

" x キーで文字を削除しても、ヤンクした内容を上書きしない
noremap PP "0p
noremap x "_x

" 検索関係
" ハイライト ON
set hlsearch

" <Esc><Esc> でハイライト OFF
nnoremap <Esc><Esc> :<c-u>set nohlsearch<CR>:ccl<CR>

" 「/」「?」「*」「#」が押されたら、ハイライトをONにして「/」「?」」「*」「#」を実行
nnoremap / :<C-u>set hlsearch<CR>/
nnoremap ? :<C-u>set hlsearch<CR>?
nnoremap * :<C-u>set hlsearch<CR>*
nnoremap # :<C-u>set hlsearch<CR>#

" 検索語が画面の真ん中に来るようにする
nmap n nzz 
nmap N Nzz 
nmap * *zz 
nmap # #zz 
nmap g* g*zz 
nmap g# g#zz

" タブ利用時のショートカット
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>

" vimgrep をより便利に
autocmd QuickFixCmdPost *grep* cwindow
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" 検索時の文字列をハイライトするか否か
" set nohlsearch    " ハイライトしない
set hlsearch        " ハイライトする

" ESCを２回叩くとハイライト解除
nnoremap <ESC><ESC> :nohlsearch<CR>

" }}}


" [オートイベント] =====================================================
" {{{

" QuickFix Window 関連
" vimgrep 実行時に、自動で cw をパイプする
autocmd QuickFixCmdPost vimgrep cwindow

" }}}


" [タブライン] =========================================================
" {{{

" タブ関係の独自関数設定はここを参考：http://thinca.hatenablog.com/entry/20111204/1322932585

" タブラインを常に表示
set showtabline=2

" }}}


" [ステータスライン] ===================================================
"{{{

" 入力中のコマンドをステータスに表示する
set showcmd


" ファイル名表示
" set statusline=%t
set statusline+=%F

" 変更チェック表示
set statusline+=%m

" 読み込み専用かどうかを表示
set statusline+=%r

" ヘルプページならば[HELP]と表示
set statusline+=%h

" プレビューウィンドウならば[Preview]と表示
set statusline+=%w

" これ以降は右詰
set statusline+=%=

" 意味なし
set statusline+=(^o^)

" 半角スペース
set statusline+=\ 

" ファイルのエンコード
set statusline+=[ENC=%{&fileencoding}]

" 現在行数/全行数
set statusline+=[%l/%L]

" ステータスラインを常に表示（０：表示しない、１：2つ以上ウィンドウがある時だけ表示）
set laststatus=2

"}}}


" [<C-K> エスケープから実行できるオリジナルショートカット] =============
" {{{

" 画面を問答無用でリフレッシュする
map <C-K>init :enew!<CR>

" }}}


