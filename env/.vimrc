
" Vundleでプラグインをインストールするための設定
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundleのプラグイン
Plugin 'VundleVim/Vundle.vim'
" lightlineのプラグイン
Plugin 'itchyny/lightline.vim'
call vundle#end()

call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'rust-lang/rust.vim'
call plug#end()

" UTF-8化
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile

" 行番号表示
set number
" 現在の行を強調表示
set cursorline
" 行末まで移動可能
set virtualedit=onemore
" smartindentの設定
set smartindent
" ビープ音を可視化
"set visualbell
" 対応する括弧の強調表示
set showmatch
" シンタックスハイライトの有効化
syntax on
" シンタックスハイライトのテーマ設定
colorscheme nord
" ステータスラインの有効化
set laststatus=2
" ステータスラインのテーマ設定
let g:lightline = { 'colorscheme': 'selenized_black' }

" マウス操作の有効化 & ホイール操作の有効化
set mouse=a
set ttymouse=xterm2

" tabを半角スペース化
"set expandtab
" 行頭以外のtabをスペース2個分にする
"set tabstop=2
" 行頭以外のtabをスペース2個分にする
"set shiftwidth=2

" 大文字小文字区別せず検索
set ignorecase
" 検索文字列に大文字が含まれていれば区別して検索
set smartcase
" 検索文字列を順次ヒットさせる
set incsearch
" 検索文字列が最後まで行ったら最初に戻る
set wrapscan
" 検索文字をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>


set tabstop=4


set belloff=all


if has("autocmd")
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif


nmap <F1> :vert term ++close ipython
nmap <F4> :wq <CR>
nmap <F5> :w <CR>:vert term ++close python % <CR> <C-w>:vert resize 75 <CR> <C-w>:<CR>
nmap <F6> :w <CR>:vert term python % <CR> 

set splitright

"filetype plugin indent on

" 保存時に自動でrustfmt
"let g:rustfmt_autosave = 1
