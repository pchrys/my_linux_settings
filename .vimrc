
" pathogen package manager{{{

execute pathogen#infect()

""" with pathegen package manager, installing plugin is easy.
""" just following the following steps
""" cd ~/.vim/bundle
""" unzip the plugin package
""" Unzip delimitMate-master.zip in ~/.vim/bundle/delimitMate-master/.
"
""" or clone submodule
""" cd ~/.vim/bundle
""" git clone https://github.com/Raimondi/delimitMate.git

""" With Git, using submodules:
"""
""" Assuming your .vim directory is already a Git repository…
"""
""" $ cd ~/.vim
""" $ git submodule init
""" $ git submodule add https://github.com/Raimondi/delimitMate.git bundle/delimitMate


"" run :HelpTags to enable help documents for newly install packages
" }}}

" basic set up{{{

filetype plugin on
set nocompatible
set encoding=utf-8
set ignorecase
set smartcase

"" automatically save file while switching to another buffer 
set autowrite

"" enabled syntax,
"" What this command actually does is to execute the command
""     :source $VIMRUNTIME/syntax/syntax.vim
"" VIMRUNTIME is set inside .bashrc file
"" export VIMRUNTIME="/usr/share/vim/vim80"
"" more detais: help syntax
syntax enable


""" set command prefix
let mapleader=","       " leader is comma
let maplocalleader="\\" " localleader is \

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ve :vsp $MYVIMRC<CR>
" nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>

"" save vim sessions into session file
nnoremap <leader>ss :mksession! ~/.vim/session.vim<CR>
""" restore vim sessions
nnoremap <leader>sr :source ~/.vim/session.vim<CR>

" show exising map using the following command
" :map or  :map!
"" jump between window

noremap <F2> <C-w><C-w>

noremap <leader>wj :wincmd j<CR>
noremap <leader>wj :wincmd j<CR>
noremap <leader>wk :wincmd k<CR>
noremap <leader>wh :wincmd h<CR>
noremap <leader>wl :wincmd l<CR>

""fix the issue that backspace does not delte delete command
set backspace=indent,eol,start
""  set t_kb=^?

""" build in command for jump between windows
"" <C-w>  h/l/j/k
"" <C-w> _/-    "" maximize the height of the current window
"" <C-w> |    "" maximize the width of the current window
"" <C-w> =    "" make windows are equal

"" fold level
nnoremap <leader>f :call FoldColumnToggle()<cr>
" }}}

" Colors {{{

colorscheme zenburn
"" light colorscheme: autumn, ashen, desert
"" dark colorscheme: badwolf

"set color
if &term =~ "xterm"
  " 256 colors
    let &t_Co = 256
endif

"" fix tmux color bleeding issue
if &term =~ "256color"
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif


""" cycle through color
"" F8, :NextColorScheme
"" Shift+F8: PrevColorScheme
"" :RandomColorScheme

" }}}


" Spaces & Tabs {{{
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1
filetype indent on
set autoindent

" note the when paste is set, softtabstop is set to 0

" }}}

" UI Layout {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline        " highlight current line
set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis
set fillchars+=vert:\|
"set fillchars=stl:^,stlnc:=,vert:\|,fold:-,diff:-
set statusline=%<\ %n:%-40F\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

"The value of this option influences when the last window will have a
"  status line:
"    0: never
"    1: only if there are at least two windows
"    2: always
"
set laststatus=2

""" toggle line number
noremap <localleader>n :setlocal number!<cr>
"
"" toggle paste
nnoremap <localleader>p :set paste!<cr>

" " }}}

" Folding {{{
"=== folding ===
" set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " fold files by default on open
" set nofoldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10   " start with fold level of 1

"" zm/zM    "" folding more
"" zr/zR    "" reduce folding
"" za/zA    "" toggle folds under cursor
"" zo/zO    "" open folds under cursor
"" zc/zC    "" close folds under cursor
"" other related command, [z, ]z, zj, zk

" " }}}

" cscope, taglist, and NERDTree {{{
""cscope and taglist
"" install cscope
""build cscope database
" use \ in the beginning at .vimrc and related files  for line continuation
if has("win32") || has("win64")
    ""on windows, open vim setting files by  :e $MYVIMRC
    noremap <C-\>b : ! dir /B /S "*.c" "*.cpp" "*.cc" "*.h" "*.hpp" "*.S" "*.java" "*.js" "*.xml" "*.jsp"  > cscope.files<CR>
        \: !cscope -b -i cscope.files -f cscope.out<CR>
        \: cscope reset<CR>
        \: cscope add cscope.out<CR>

elseif has("unix")
    noremap <C-\>b : !find `pwd` -iname '*.c' -o -iname '*.cpp' -o -iname '*.cc' -o -iname '*.S'
            \-o -iname '*.h' -o -iname '*.hh' -o -iname '*.hpp' -o -iname '*.java' -o -iname '*.js'
            \-o -iname '*.xml' -o -iname '*.jsp' > cscope.files<CR>
        \: !cscope -b -i cscope.files -f cscope.out<CR>
        \: cscope reset<CR>
        \: cscope add cscope.out<CR>
endif

"""   on windows, using command in windows command prompt
"""   dir /S /B *.h *.cpp *.hpp *.c  > cscope.files
"""   to list files,
"""   then use the following command to build cscope database
"""   cscope.exe -b -i cscope.files -f cscope.out


"""  Cscope is a very powerful interface allowing you to easily navigate C-like code files.
"""  While Cscope comes with its own stand-alone interface, Vim provides the capability to
"""  navigate code without ever leaving the editor. Using Cscope, you can search for
"""  identifier or function definitions, their uses, or even any regular expression. With
"""  the proper configuration, "standard" include files of your compiler are automatically
"""  searched along with your sources. The output from :help :cscope says it all:
"""
"""  cscope commands:
"""  add  : Add a new database             (Usage: add file|dir [pre-path] [flags])
"""  find : Query for a pattern            (Usage: find c|d|e|f|g|i|s|t name)
"""         c: Find functions calling this function
"""         d: Find functions called by this function
"""         e: Find this egrep pattern
"""         f: Find this file
"""         g: Find this definition
"""         i: Find files #including this file
"""         s: Find this C symbol
"""         t: Find assignments to
"""  help : Show this message              (Usage: help)
"""  kill : Kill a connection              (Usage: kill #)
"""  reset: Reinit all connections         (Usage: reset)
"""  show : Show connections               (Usage: show)

""" filter cscope result
" Filter the quickfix list
function! FilterQFList(type, action, pattern)
    " get current quickfix list
    let s:curList = getqflist()
    let s:newList = []
    for item in s:curList
        if a:type == 0     " filter on file names
            let s:cmpPat = bufname(item.bufnr)
        elseif a:type == 1 " filter by line content
            let s:cmpPat = item.text . item.pattern
        endif
        if item.valid
            if a:action < 0
                " Keep only nonmatching lines
                if s:cmpPat !~ a:pattern
                    let s:newList += [item]
                endif
            else
                " Keep only matching lines
                if s:cmpPat =~ a:pattern
                    let s:newList += [item]
                endif
            endif
        endif
    endfor
    call setqflist(s:newList)
endfunction

""" :help cscope-options
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
"""" :copen to show all search result
""" :copen 60  """ set quickfix window height to 60
"""  :cnewer and :colder to jump through quickfix windows
" command for jump in quickfix window
""" :cc      see the current error
""" :cn      next error
""" :cp      previous error
""" :clist   list all errors

nnoremap mf  :call FilterQFList(0, 1, inputdialog('Keep only file names matching:', ''))<CR>
nnoremap mF  :call FilterQFList(0, -1, inputdialog('Remove file names matching:', ''))<CR>
nnoremap mL  :call FilterQFList(1, -1, inputdialog('Remove all lines matching:', ''))<CR>
nnoremap ml  :call FilterQFList(1, 1, inputdialog('Keep only lines matching:', ''))<CR>

"" taglist
" let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 48
noremap <leader>tl :TlistToggle<cr>
noremap <F3> :TlistToggle<cr>


"" NERDTree
noremap <leader>nt :NERDTreeToggle<cr>
let g:NERDTreeWinSize = 48
let g:NERDTreeWinPos = "right"


" }}}

" Tab pages {{{
""  tabs
" :tabedit {file}   edit specified file in a new tab
" :tabfind {file}   open a new tab with filename given, searching the 'path'
" to find it
" :tabclose         close current tab
" :tabclose {i}     close i-th tab
" :tabonly          close all other tabs (show only the current tab)
"
" :tab ball         show each buffer in a tab (up to 'tabpagemax' tabs)
" :tab help         open a new help window in its own tab page
" :tab drop {file}  open {file} in a new tab, or jump to a window/tab containing the file if there is one
" :tab split        copy the current window to a new tab of its own
"

""" navigation between tabs
"" :tabs         list all tabs including their displayed windows
"" :tabm 0       move current tab to first
"" :tabm         move current tab to last
"" :tabm {i}     move current tab to position i+1
""
"" :tabn         go to next tab
"" :tabp         go to previous tab
"" :tabfirst     go to first tab
"" :tablast      go to last tab
""
"" In normal mode, you can type:
"" gt            go to next tab
"" gT            go to previous tab
"" {i}gt         go to tab in position i
""

nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap te  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
" Alternatively use
" "nnoremap th :tabnext<CR>
" "nnoremap tl :tabprev<CR>
" "nnoremap tn :tabnew<CR>
" }}}

" Buffer explorer {{{
"=== buffer exploer  ===
" If you do not like the default key mappings of <Leader>be, <Leader>bs, and
" <Leader>bv, you can override bufexplorer's default mappings by setting up
" something like the following in your vimrc file:

"  nnoremap <silent> <F11> :BufExplorer<CR>
"  nnoremap <silent> <s-F11> :ToggleBufExplorer<CR>
"  nnoremap <silent> <m-F11> :BufExplorerHorizontalSplit<CR>
"  nnoremap <silent> <c-F11> :BufExplorerVerticalSplit<CR>

"To control what field the buffers are sorted by, use: >
"  let g:bufExplorerSortBy='extension'  " Sort by file extension.
"  let g:bufExplorerSortBy='fullpath'   " Sort by full file path name.
"  let g:bufExplorerSortBy='mru'        " Sort by most recently used.
"  let g:bufExplorerSortBy='name'       " Sort by the buffer's name.
"  let g:bufExplorerSortBy='number'     " Sort by the buffer's number.
"The default is to sort by mru.
"
" }}}

" CtrlP {{{
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,build,3rdparty     " Linux/MacOSX
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" note the window is not scrollable due to efficiency concern
 let g:ctrlp_match_window = 'min:4,max:60,results=60'

" "The maximum number of files to scan, set to 0 for no limit:
let g:ctrlp_max_files =100000


let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)|\build$'
" let g:ctrlp_custom_ignore = {
"    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"    \ 'file': '\v\.(exe|so|dll)$',
"    \  'link': 'SOME_BAD_SYMBOLIC_LINKS'
"    \ }
"
"Once CtrlP is open:
"
"    Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
"    Press <c-f> and <c-b> to cycle between modes.
"    Press <c-d> to switch to filename search instead of full path.
"    Press <c-r> to switch to regexp mode.
"    Use <c-j>, <c-k> or the arrow keys to navigate the result list.
"    Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
"    Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
"    Use <c-y> to create a new file and its parent directories.
"    Use <c-z> to mark/unmark multiple files and <c-o> to open them.
"
" Run :help ctrlp-mappings or submit ? in CtrlP for more mapping help.
" }}}

" Auto completion {{{
"" build-in completion: help ins-completion


"" You complete me (YCM) ,
"" let g:ycm_global_ycm_extra_conf = ''
" let g:ycm_global_ycm_extra_conf = '/home/shaobo/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" let g:ycm_global_ycm_extra_conf = $HOME . '/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0    "" disable confirmation
"
"" let g:ycm_extra_conf_globlist = ['~/dev/*','!~/*']

" }}}

" Clang-format {{{

let g:clang_format#code_style = "file"

"" When this variable's value is 1, vim-clang-format automatically detects the style file
"" like .clang-format or _clang-format and applies the style to formatting.
let g:clang_format#detect_style_file = 1

"" When the value is 1, a current buffer is automatically formatted on saving the buffer.
let g:clang_format#auto_format = 0

"" When the value is 1, inserted lines are automatically formatted on leaving insert mode.
"" Formatting is executed on InsertLeave event
let g:clang_format#auto_format_on_insert_leave = 0

"let g:clang_format#style_options = {
"            \ "AccessModifierOffset" : -4,
"            \ "AllowShortIfStatementsOnASingleLine" : "true",
"            \ "AlwaysBreakTemplateDeclarations" : "true",
"            \ "Standard" : "C++11"}
"

"" map to <Leader>cf in C++ code
augroup clangformat
    autocmd!

    autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
    autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

     " if you install vim-operator-user
     autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
 augroup END
 "
 " Toggle auto formatting:
 nmap <leader>ct :ClangFormatAutoToggle<CR>

" }}}

" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    "autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb *.h *.c *.hpp *.cpp *cc :call <SID>StripTrailingWhitespaces()
    "
    """ remove trailing white space
     "autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb,*.h,*.c,*.hpp,*.cpp,*.cc :%s/\s\+$//e<CR>
     autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb,*.h,*.c,*.hpp,*.cpp,*.cc %s/\s\+$//e

    " autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> %s/\s\+$//e

    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter *.py setlocal tabstop=4
    autocmd BufEnter *.md setlocal filetype=markdown

    """ note no space between pattens
    autocmd BufEnter *.h,*.hpp,*.cpp,*.c,*.cc setlocal foldmethod=syntax
    ""autocmd FileType cpp setlocal foldmethod=syntax
    "autocmd FileType python setlocal foldmethod=syntax
    autocmd BufEnter *.py setlocal foldmethod=indent

    "" set folding method for .vimrc
    autocmd BufEnter *.vimrc setlocal foldmethod=marker foldlevel=0
augroup END
" }}}


" Backups {{{
let backupRootDir = $HOME . "/.vim.backup"
if !isdirectory(backupRootDir)
    call mkdir(backupRootDir)
endif
" let &backupdir = backupRootDir

set backupskip=/tmp/*,/private/tmp/*

" directory for swap files
set directory=~/.vim.backup,~/.tmp,~/tmp,/var/tmp,/tmp


set backup
" Make a backup before overwriting a file.  The backup is removed after
" the file was successfully written, unless the 'backup' option is
" also on.
set writebackup
"
""back up with directory hierarchy
au BufWritePre *
            \ let cmd = "set backupext=" . strftime("~%Y-%m-%d_%H:%M:%S", localtime()) |
            \ exe cmd |
            \ let verboseBackupDir = backupRootDir . fnamemodify("%",":p:h") |
            \ if !isdirectory(verboseBackupDir) |
            \   call mkdir(verboseBackupDir, "p") |
            \ endif |
            \ let cmd = "set backupdir=" . verboseBackupDir |
            \ exe cmd

" let has_windows = has("win16") || has("win32") || has("win64")
"
" if has_windows
"     substitute(backupdir, '\v^\u\zs:\ze\\','','')
" endif
"

" }}}

" Custom Functions {{{
" " We can move all custom function to .vim/bundle/myplugin/plugin, and
" pathogen package manager will load them automatically.
"
" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction


function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction
" }}}
