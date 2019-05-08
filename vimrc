"==================="
"1.基本设置"
"==================="
set wildmenu"按TAB键时命令行自动补齐"
set ignorecase"忽略大小写"
set number "显示行号"
set ruler"显示当前光标位置"
set autoread"文件在Vim之外修改过，自动重新读入"
set nocp "使用vim而非vi"
set showtabline=2 " Always display the tabline, even if there is only one tab
set encoding=utf-8
set cursorline                  " 突出显示当前行
autocmd InsertLeave * se nocul  " 用浅色高亮当前行
autocmd InsertEnter * se cul    " 用浅色高亮当前行
set ruler           " 显示标尺
set showcmd         " 输入的命令显示出来，看的清楚些
if has('mouse')
   set mouse=a
endif

"==================="
"2.程序开发相关的设置"
"==================="
syntax enable   "开启代码高亮 syntax on??
"(1) python
au BufNewFile,BufRead *.py exec ":call SetPythonConfig()"
func SetPythonConfig()
    set fileformat=unix
    set cc=80
    set suffixesadd+=.py
endfunc

"============="
"3. 设置缩进"
"============="
"set smartindent"智能缩进
set tabstop=4"虽然自己用空格代替tab，但看别人代码，还是设置tab长度才能更好看代码；
set autoindent"参考上一行的缩进方式进行自动缩进"
filetype indent on "根据文件类型进行缩进"
set shiftwidth=4"每一级缩进的长度
set smarttab"当使用将Tab替换为空格之后，按下一个Tab键就能插入4个空格，但要想删除，就得按4下Backspace，很不方便。设置smarttab之后，就可以只按一下Backspace就删除 4 个空格了
set expandtab "缩进用空格表示
set softtabstop=4 "退格键退回缩进长度,expandtab中用

"================="
"4. 当前文件内搜索选项"
"================="
set hlsearch "开启搜索结果的高亮显示"
set incsearch "边输入边搜索(实时搜索)"

"================="
"5. 插件，使用 vundle 参考https://www.jianshu.com/p/a0b452f8f720”
" mkdir ~/.vim "
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle "
"   安装命令：打开vim，运行:BundleInstall或在shell中直接运行vim +BundleInstall +qall "
"================="

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Define bundles via Github repos
Bundle "scrooloose/nerdtree"
Bundle "ajh17/VimCompletesMe"
filetype on

filetype plugin indent on

"================="
"5.1. Nerd Tree"
"================="
let NERDChristmasTree=0
let NERDTreeWinSize=40
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
autocmd vimenter * if !argc() | NERDTree | endif " Automatically open a NERDTree if no files where specified
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " Close vim if the only window left open is a NERDTree
nmap <F5> :NERDTreeToggle<cr>
