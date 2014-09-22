"常用快捷键列表
"------------------------------------------------
"w 为下一个单词到开始
"e 为下一个单词的末尾
"b 为上一个单词
"$ 为整行
"以上均可组合下面的模式来使用 譬如 d2w d2e
"0 到达一行的开始
"x 删除一个字母
"A 一行的最后开始进入编辑模式
"o 光标的下一行开始进入编辑模式
"O 光标的上一行进入编辑模式
"y 复制,可组合w,e,s,v
"------------------------------------------------------
"d 为删除模式
"c 为删除并成为编辑模式
"r 为替代模式
"v 视图模式
"R 为长时间替代模式
"------------------------------------------------------
" 搜索
"/ 向下查询
"? 向上方向
"<CTRL+O> 回到搜索前的位置
"p 粘贴
"% 切换到对应的{}[]()
"-------------------------------------------------------
"u 撤销动作
"<CTRL+R> 恢复动作
"-------------------------------------------------------
" 替换
":s/old_words/new_words/选项 替换第一个
"选项:g 替换这一行所有
":%s/old/new/g 替换文件中所有
":%s/old/new/gc 替换文件中所有并且询问是否覆盖
"#,#s/old/new/g #,#为数字范围，替换范围内
"--------------------------------------------------------
"% 	跳转到配对的括号去
"[[ 	跳转到代码块的开头去(但要求代码块中'{'必须单独占一行)
"gD 	跳转到局部变量的定义处
"'' 	跳转到光标上次停靠的地方, 是两个', 而不是一个"
"mx 	设置书签,x只能是a-z的26个字母
"`x 	跳转到书签处("`"是1左边的键)
"> 	增加缩进,"x>"表示增加以下x行的缩进
"< 	减少缩进,"x<"表示减少以下x行的缩进
"---------------------------------------------------------
"tags命令
"^] 寻找tags文件中寻找光标所在位置的标识符
"^T 回到标签栈的前一个位置
"
"------------------------------------------------------------
"我的一些快捷键
",ww 写入
",wf 强制写入
",qw 写入并退出
",qf 强制退出
",回车 清除高亮显示
",rr 重载文件
",wm 打开左侧的列表
",hl 高亮当前单词
",hh 清除当前高亮单词
",zo 打开关闭折叠
",lk 查找文件
",ll 查找bufer
"ctrl+F12 循环生成tage,并加入环境里面的tag
"F12 头文件和cpp文件切换
",ss source .vimrc
",ee 转换到.vimrc的bufer
",*或者,# 在试图模式下选中需要搜索的单词再按下,*
",bc 关闭buffer
"ctrl+],CTRL+F, 插入模式下查找tage
":split otherfile  分割窗口 :15split ++fileformate=unix otherfile

"<Leader>mt   - 打开/关闭ShowMarks插件
"<Leader>mo   - 强制打开ShowMarks插件
"<Leader>mh   - 清除当前行的标记
"<Leader>ma   - 清除当前缓冲区中所有的标记
"<Leader>mm   - 在当前行打一个标记，使用下一个可用的标记名 
",bh   转化成16进制显示
",g/G  快速注释和取消注释
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"根据系统设置配色方案，字体大小，编码,快捷键设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"常用设置
set nocompatible
filetype on
filetype plugin indent on
set number
set wildmenu
set hidden
set whichwrap+=<,>,h,l 
if filereadable("workspace.vim")
    source workspace.vim
endif 
set showmatch 
" 在搜索的时候忽略大小写 
set ignorecase 


set confirm                                                ""未保存已修改的文件和修改只读文件时确认
set autoread                                               ""外部文件改变时自动读取
set mouse=a
set history=300
"设置无swap文件
set noswapfile
set nobackup
set nowb

"tab键
set expandtab
set shiftwidth=4
set smarttab
set exrc


"搜索相关
set hlsearch
map <silent><leader><cr> :noh<cr>
set incsearch       " 查询时非常方便，如要查找book单词，当输入到/b时，会自动找到
                    " 第一个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的
                    " 单词，依次类推，进行查找时，使用此设置会快速找到答案，当你
                    " 找要匹配的单词时，别忘记回车

"fold相 关
set foldenable
set foldcolumn=3
set foldmethod=manual
set cindent

"set foldmethod=manual
"set foldlevel=0
"zc 关闭打开的折叠
"zF 开始折叠


"hidden"设置快捷键
let mapleader = ","
let g:mapleader = ","

"设置配色方案,字体
set guifont=Ubuntu\ Mono\ 12
set t_Co=256 
"set guifont=YaHei_Consolas_Hybrid:h12:cANSI
"set guifont=Lucida_Console:h12:cANSI
colo molokai  
let g:molokai_original = 1
let g:rehash256 = 1


"设置文件编码
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

"快速读取.vimrc
function! MySys()
    if has("win32")
        return "windows"
    else
        return "linux"
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fast edit vimrc
if MySys() == 'linux'
    "Fast reloading of the .vimrc
    map <silent> <leader>ss :source ~/.vimrc<cr>
    "Fast editing of .vimrc
    map <silent> <leader>ee :call SwitchToBuf("~/.vimrc")<cr>
    "When .vimrc is edited, reload it
    autocmd! bufwritepost .vimrc source ~/.vimrc
elseif MySys() == 'windows'
    " Set helplang
    set helplang=cn
    "Fast reloading of the _vimrc
    map <silent> <leader>ss :source ~/_vimrc<cr>
    "Fast editing of _vimrc
    map <silent> <leader>ee :call SwitchToBuf("~/_vimrc")<cr>
    "When _vimrc is edited, reload it
    autocmd! bufwritepost _vimrc source ~/_vimrc
endif

function! SwitchToBuf(filename)
    "let fullfn = substitute(a:filename, "^\\~/", $HOME . "/", "")
    " find in current tab
    let bufwinnr = bufwinnr(a:filename)
    if bufwinnr != -1
        exec bufwinnr . "wincmd w"
        return
    else
    "find in each tab
        tabfirst
        let tab = 1
        while tab <= tabpagenr("$")
            let bufwinnr = bufwinnr(a:filename)
            if bufwinnr != -1
                exec "normal " . tab . "gt"
                exec bufwinnr . "wincmd w"
            return
            endif
        tabnext
        let tab = tab + 1
        endwhile
" not exist, new tab
        exec "tabnew " . a:filename
        endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Platform
if MySys() == 'linux'
    map <silent> <leader>ss :source ~/.vimrc<cr>
    map <silent> <leader>ee :call SwitchToBuf("~/.vimrc")<cr>
    autocmd! bufwritepost .vimrc source ~/.vimrc
elseif MySys() == 'windows'
    set helplang=cn
    map <silent> <leader>ss :source ~/_vimrc<cr>
    map <silent> <leader>ee :call SwitchToBuf("~/_vimrc")<cr>
    autocmd! bufwritepost _vimrc source ~/_vimrc
endif


"快速保存
nmap <silent> <leader>bb :%!xxd<cr>
nmap <silent> <leader>br :%!xxd -r<cr>
nmap <silent> <leader>ww :w<cr>
nmap <silent> <leader>wf :w!<cr>

"Fast quiting
nmap <silent> <leader>qw :wq<cr>
nmap <silent> <leader>qf :q!<cr>
nmap <silent> <leader>qq :q<cr>
nmap <silent> <leader>qa :qa<cr>

"use <c-i,j,h,k> to move cursor in different windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

"use 
nmap <leader>wv     <C-w>v.     " 垂直分割当前窗口
nmap <leader>wc     <C-w>c.     " 关闭当前窗口
nmap <leader>ws     <C-w>s..     " 水平分割当前窗口

"fast add and remove /**/
map <leader>g 0I/* <C-[>A */<C-[> 
map <leader>G 03x$bh3x

"fast change 2 hex mode
map <leader>bh :%!xxd 
map <Leader>bhr :%!xxd -r

function! Tags_Rebuild_Add()
    exec "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ./"
    set tags+=./tags 
endfunction
map <C-F12> :call Tags_Rebuild_Add()<CR>

set tags+=./tags

function! Cscope_Rebuild_Add()
    !cscope -Rbq
    :cs add ./cscope.out .
endfunction
map <C-S-F12> :call Cscope_Rebuild_Add()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set statusline
set laststatus=2
function! CurDir()
    let curdir = substitute(getcwd(), '/home/caojun/', "~/", "g")
    return curdir
endfunction
set statusline=\ %F%m%r%h\ %w\ \ CWD:\%r%{CurDir()}%h\ %=Position:\ %p\ line:%l\ col:%c\ char:%b\ \ \ 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"auto detect filetype
augroup newFileDetection
autocmd CursorMovedI * call CheckFileType()
augroup END
function! CheckFileType()
  if exists("b:countCheck") == 0
    let b:countCheck = 0
  endif
  let b:countCheck += 1
  if  &filetype == "" && b:countCheck >20 && b:countCheck <100
    filetype detect
  elseif b:countCheck >=100 || &filetype !=""
    autocmd! newFileDetection
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"plugin
"--------------------------------------------------------------------------------
" TagList :Tlist
"--------------------------------------------------------------------------------
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow = 1

"--------------------------------------------------------------------------------
" WinManager :WMToggle
"--------------------------------------------------------------------------------
""目录界面常用命令
"<F1> 	显示帮助
"<cr> 	如果光标下是目录, 则进入该目录; 如果光标下文件, 则打开该文件
"-	返回上级目录
"c	切换vim 当前工作目录正在浏览的目录
"d	创建目录
"D	删除目录或文件
"i	切换显示方式
"R	文件或目录重命名
"s	选择排序方式
"x	定制浏览方式, 使用你指定的程序打开该文件

let g:winManagerWindowLayout='FileExplorer,BufExplorer|TagList'
let g:winManagerWidth = 30
let g:defaultExplorer = 0
"nmap <C-w><C-b> :BottomExplorerWindow<cr> " 切换到最下面一个窗格
"nmap <C-w><C-f> :FirstExplorerWindow<cr>   " 切换到最上面一个窗格
nmap <leader>wm :WMToggle<cr> "是nomal模式的命令，不是Ex模式的

"--------------------------------------------------------------------------------
" cscope
"--------------------------------------------------------------------------------
"cscope的主要功能是通过同的子命令"find"来实现的
"cscope find"的用法:
"cs find c|d|e|f|g|i|s|t name
"0 或 s  查找本 C 符号(可以跳过注释)
"    1 或 g      查找本定义
"    2 或 d      查找本函数调用的函数
"    3 或 c      查找调用本函数的函数
"    4 或 t      查找本字符串
"    6 或 e      查找本 egrep 模式
"    7 或 f      查找本文件
"    8 或 i      查找包含本文件的文件
:set cscopequickfix=s-,c-,d-,i-,t-,e-
:set cscopetag
" 按下面这种组合键有技巧,按了<C-_>后要马上按下一个键,否则屏幕一闪
" 就回到nomal状态了
" <C-_>s的按法是先按"Ctrl+Shift+-",然后很快再按"s"
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<cr><cr> :cw<cr>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<cr><cr> :cw<cr>

"--------------------------------------------------------------------------------
" QuickFix
"--------------------------------------------------------------------------------
nmap <F6> :cn<cr>   " 切换到下一个结果
nmap <F7> :cp<cr>   " 切换到上一个结果


"<Tab> 	向前循环切换到每个buffer名上
"<S-Tab> 	向后循环切换到每个buffer名上
"<Enter> 	在打开光标所在的buffer
"d 	删除光标所在的buffer

"--------------------------------------------------------------------------------
" MiniBufExp
"--------------------------------------------------------------------------------
"let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

"--------------------------------------------------------------------------------
" A 在头文件和cpp文件切换
"--------------------------------------------------------------------------------
nnoremap <silent> <F12> :A<CR>

"--------------------------------------------------------------------------------
" Grep
"--------------------------------------------------------------------------------
"直接按下<F3>键来查找光标所在的字符串
nnoremap <silent> <F3> :Rgrep<CR>

"--------------------------------------------------------------------------------
"visual mark
"--------------------------------------------------------------------------------
"<C-F2>或者mm 标记一个书签
"<F2> 来到下一个书签
"<S-F2>返回上一个书签

"--------------------------------------------------------------------------------
" SuperTab :SuperTabHelp
"--------------------------------------------------------------------------------
set completeopt=longest,menu
"let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"


"--------------------------------------------------------------------------------
" BufExplorer
"--------------------------------------------------------------------------------
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber 
""""""""""""""""""""""""""""""
" showmarks setting
""""""""""""""""""""""""""""""
" Enable ShowMarks
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1 
