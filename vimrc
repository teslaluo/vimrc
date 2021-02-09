"=============通用设置===============
"识别文件编码
set fencs=ucs-bom,utf-8,cp936

"统一转成utf-8
set fenc=utf-8
set enc=utf-8

"关闭vi兼容模式"
set nocompatible

" 支持高亮
syntax on

""设置历史记录步数"
set history=1000

"开启相关插件"
""侦测文件类型"
filetype on
"载入文件类型插件"
filetype plugin on
""为特定文件类型载入相关缩进文件"
filetype indent on

"当文件在外部被修改时，自动更新该文件"
set autoread

"带有如下符号的单词不要被换行分割"
set iskeyword+=_,$

"通过使用: commands命令，告诉我们文件的哪一行被改变过"
set report=0
 
set tw=300

"==============编辑设置=================
"使用空格来替换Tab"
set expandtab

""设置所有的Tab和缩进为4个空格"
set tabstop=4

"设定<<和>>命令移动时的宽度为4"
set shiftwidth=4

""使得按退格键时可以一次删除4个空格"
set softtabstop=4
set smarttab

"缩进，自动缩进（继承前一行的缩进）"
""set autoindent 命令打开自动缩进，是下面配置的缩写
"可使用autoindent命令的简写，即“:set ai”和“:set noai”
""还可以使用“:set ai sw=4”在一个命令中打开缩进并设置缩进级别
set ai
set cindent

"智能缩进
set si

"设置软宽度
set sw=4


"搜索逐字符高亮"
set hlsearch
set incsearch

"支持退格
set backspace=indent,eol,start

"=============其他设置================
"tags文件搜素
set tags=tags;
"增加一些基础库的tag文件，根据需要来修改
set tags+=/data/code/protocol/src/tags
set tags+=/data/code/libc/include/tags

"color evening

hi Folded   term=standout       ctermbg=DarkGrey       ctermfg=green        guibg=LightGrey     guifg=green

"记住上次打开的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

nmap te :tabedit

" 文件查找
"当前文件内查找
noremap <F3> :vimgrep /<C-R>=expand("<cword>")<CR>/j  % <CR> \| :copen<CR>
"当前目录内查找(同后缀)
noremap <F4> :vimgrep /<C-R>=expand("<cword>")<CR>/j  **/*.%:e **/*.cpp **/*.h  <CR> \| :copen<CR>

noremap <F8> :!ctags -R --fields=+lS --c-kinds=+p .<CR>
noremap <F9> :!ctags -R --langdef=Go --langmap=Go:.go --regex-Go="/func([ \t]+\([^)]+\))?[ \t]+([a-zA-Z0-9_]+)/\2/d,func/" --regex-Go="/var[ \t]+([a-zA-Z_][a-zA-Z0-9_]+)/\1/d,var/" --regex-Go="/type[ \t]+([a-zA-Z_][a-zA-Z0-9_]+)/\1/d,type/" <CR>

"窗口切换
nmap <TAB> <C-W><C-W>

"翻页
map <C-j> 20j
map <C-k> 20k

"ctag跳转
nmap fj g]
nmap ff <C-T>


fun! ToggleFold()
    if foldlevel('.') == 0
    normal! l
    else
    if foldclosed('.') < 0
    . foldclose!
    else
    . foldopen!
    endif
    endif
    " Clear status line
    echo
endfun

"空格键折叠/展开折叠
noremap <space> :call ToggleFold()<CR>  

function FoldBrace()
    if getline(v:lnum+1)[0] == '{'
    return 1
    endif
    if getline(v:lnum) =~ '{'
    return 1
    endif
    if getline(v:lnum)[0] =~ '}'
    return '<1'
    endif
    return -1
endfunction

au BufReadPost *.h,*.hh,*.c,*.ec,*.cpp,*.hpp,*.ecpp,*.pc,*.go set foldexpr=FoldBrace()
au BufReadPost *.h,*.hh,*.c,*.ec,*.cpp,*.hpp,*.ecpp,*.pc,*.go set foldmethod=expr
au BufReadPost *.h,*.hh,*.c,*.ec,*.cpp,*.hpp,*.ecpp,*.pc,*.go set foldenable



"=================taglist.vim======================
noremap <F11> :TlistToggle<CR>
let Tlist_Show_One_File = 1     
let Tlist_Exit_OnlyWindow = 1  "剩下taglist窗口时退出vim 
let Tlist_Use_Right_Window = 1  "使用右端窗口

"==================NERD_tree.vim====================
"设置快捷键"
noremap <F2> :NERDTreeToggle<cr> 

"不显示隐藏文件(好像只在linux环境中有效)"
let NERDTreeShowHidden=0    
"排序"
let NERDTreeSortOrder=['//$','/.cpp$','/.c$', '/.h$', '/.py$', '/.lua$', '*']  
"不分大小写排序"
let NERDTreeCaseSensitiveSort=0  
"设置窗口尺寸"
"let NERDTreeWinSize=30
"是否显示行号"
"let NERDTreeShowLineNumbers=1
"是否显示书签"
"let NERDTreeShowBookmarks=1 
"打开文件后, 关闭NERDTrre窗口"
"let NERDTreeQuitOnOpen=1
"高亮NERDTrre窗口的当前行"
let NERDTreeHighlightCursorline=1

"=================BufExplorer.vim===================
noremap zz :BufExplorer<CR>
