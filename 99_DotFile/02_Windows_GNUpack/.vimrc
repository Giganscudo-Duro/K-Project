
" [基本設定] ===========================================================
" {{{

" Vim による強制的な改行を無効化
set tw=0

" ヤンク値をクリップボードにセットする
set clipboard=unnamed

" undo ファイルを作らせない
set noundofile


" スワップファイルを作らない
set noswapfile

" ファイルを上書きする前にバックアップを作らせない
" set nowritebackup
set nobackup

" 編集中のファイルが変更されたら自動で読み込む
" set autoread

" バッファが編集中でもその他のファイルを開けるようにする
" set hidden

" 入力中のコマンドをステータスに表示する
" set showcmd

" 文字エンコーディング
set encoding=utf-8
set fileencodings=iso-2022-jp,iso-2022-jp-2,utf-8,euc-jp,sjis

" エラーベルを鳴らさない
" set noerrorbells
" set visualbell
set belloff=all

" vim利用中に保持したレジスタやら何やらをviminfoに保存する。
" 一応こんなのを設定できるらしい
" - コマンドライン履歴と検索履歴
" - レジスタ
" - マーク
" - バッファリスト
" - グローバル変数
" ただし、面倒なので何も指定しない
set viminfo=

" シンタックスハイライトを有効にする
syntax enable

" タブを半角の空白に
set expandtab

" タブの半角空白数を４に
set tabstop=4

" 検索時、検索がファイル末尾に到着したら、先頭から再度検索
" set wrapscan

" 検索時に大文字小文字を無視（noignorecase:無視しない）
set ignorecase

" 検索時、文字を入力した時点で検索を開始
set incsearch

" 検索時、検索ワードに大文字小文字の両方が含まれている場合は区別する
set smartcase

" タイトルを表示
set title

" スペルチェックを有効に
set spell
set spelllang=en,cjk

" 折り畳みを有効にする {{{ と }}} で囲む
set foldmethod=marker

" オリジナルの折り畳み関数に差し替える
" set foldtext=FoldCCtext()

" }}}


" [表示系] =============================================================
" {{{

" 行番号を表示
set nu

" カーソルラインの表示
set cursorline

" 72文字までの色を付けるだけ
set colorcolumn=72

" バッファ中の隠れているTabを表示する
" 行末の隠れた半角スペースを表示する
set list listchars=tab:>-,trail:_

" カーソルを点滅させない
set guicursor=a:blinkon0

" 対応するかっこを強調表示
set showmatch

" 通常vimでは 以下のカラースキームを利用する
colorscheme industry

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

" ファイル名表示
set statusline=%t


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
set statusline+=

" 半角スペース
set statusline+=\ 

" ファイルのエンコード
set statusline+=[ENC=%{&fileencoding}]

" カーソルのある場所までの文字数をカウント
" wordcount.vim を導入済みの場合のみ有効にすること
" set statusline+=[Count=%{WordCount()}]
" set updatetime=500

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


