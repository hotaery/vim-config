"打开行号
set number
"关闭行号
"set nonumber
"开启语法高亮功能
syntax enable
"语法高亮
syntax on
"stl容器高亮
syntax keyword cppSTLtype initializer_list
syntax keyword cppSTLtype vector
"底部显示当前模式
set showmode
"底部显示cmd
set showcmd
"编码utf-8
set encoding=utf-8
"启用256色
set t_Co=256
"文件类型检查，载入对应的缩进规则，缩进规则存放在~/.vim/indent/python.vim
filetype indent on
"换行缩进和上一行一致
set autoindent
"tab是4个空格
set tabstop=4
"tab自动转为空格
set expandtab
"tab是4个空格
set softtabstop=4
"光标所在行高亮
set cursorline
"光标显示列高亮
set cursorcolumn
"禁止自动折行
set nowrap
"不会在单词上折行
set linebreak
"显示状态栏
set laststatus=2
"状态栏显示光标位置
set ruler
"高亮括号匹配
set showmatch
"高亮搜索结果
set hlsearch
"搜索自动跳转到第一个命中结果
set incsearch
"搜索忽略大小写
set ignorecase
"配色方案
set background=dark
"colorscheme solarized
"colorscheme molokai
"colorscheme phd
"营造专注氛围
"禁止光标闪烁
set gcr=a:block-blinkon0
"禁止显示滚动条
set guioptions-=l
set guioptions=-L
set guioptions=-r
set guioptions-=-R
"禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
"将外部命令wmctrl控制窗口最大化的命令行参数封装成一个vim函数
fun! ToggleFullscreen()
        call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
"全屏开关,F11实现是否全屏
map <silent> <F11> :call ToggleFullscreen()<CR>
"启动vim时自动全屏
autocmd VimEnter * call ToggleFullscreen()
"设置字体，中文yahei，英文consolas
set guifont=YaHei\ Consolas\ Hybrid\ 11.5
"设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'
"代码缩进，当阅读别人代码时可以使用命令retab，让vim自动处理tab为空格
"自适应不同语言的只智能缩进
filetype indent on
"将tab扩展为空格
set expandtab
"设置编辑模式下输入一个tab占多少空格
set tabstop=4
"设置格式化源码时一个tab占多少空格
set shiftwidth=4
"设置连续的空格作为一个tab，这里是为了方便删除
set softtabstop=4
"将相同缩进代码用类似vscode关联起来，使用插件Indent Guides
"indent guides随vim同时启动
"let g:indent_guides_enable_on_vim_startup=1
"从第2层开始可视化缩进
"let g:indent_guides_start_level=2
"色块宽度
"let g:indent_guides_guide_size=1
"设置快捷键开关缩进可视化
"nmap <silent> <Leader>i <Plug>IndentGuideToggle
"代码折叠
"基于缩进或者语法进行折叠
"set foldmethod=indent
set foldmethod=syntax
"启动vim时关闭折叠代码
set nofoldenable
"*.cpp和*.h快速切换
nmap <silent> <Leader>if :FSHere<cr>
"代码补全
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
"文件类型检测
filetype on
"不同类型文件加载不同插件
filetype plugin on
"设置快捷键到行首和行尾
nmap LB 0
nmap LE $
"设置快捷键<Leader>
"let mapleader=";"
"定义快捷键在结对符之间跳转
nmap <Leader>m %
"跳转至右方的子窗口 <C-W>表示ctrl键
nnoremap <Leader>lw <C-W>l
"跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
"跳转至上方的窗口
nnoremap <Leader>kw <C-W>k
"跳转至下方的窗口
nnoremap <Leader>jw <C-W>j
"让配置立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'
Plugin 'lilydjwg/fcitx.vim'
Plugin 'yegappan/grep'
Plugin 'mileszs/ack.vim'
" 插件列表结束
call vundle#end()
" 根据文件类型匹配插件
filetype plugin indent on
"生成标识符列表
"标识符列表在左侧
let tagbar_left=1
"设置显示/隐藏标签列表窗口快捷键
nnoremap <Leader>ilt :TagbarToggle<cr>
"设置标识符列表窗口宽度
let tagbar_width=32
"tagbar子窗口不显示冗余帮助信息
let g:tagbar_compact=1
"设置ctags对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
            \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\}
"正向遍历同名标签，用于跳转函数定义
nmap <Leader>tn :tnext<CR>
"反向遍历同名标签
nmap <Leader>tp :tprevious<CR>
"自动更新标识符文件
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
nnoremap <Leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>jd :YcmCompleter GoToDefinition<CR>
"查找显示上下文
let g:ctrlsf_ackprg='ack'
"模板补全
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
"识别STL标签
let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]
" YCM 补全菜单配色
" 菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
set tags+=/data/misc/software/misc./vim/stdcpp.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全          
let g:ycm_seed_identifiers_with_syntax=1
