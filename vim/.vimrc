if has("autocmd")
  autocmd! bufwritepost .vimrc source ~/.vimrc
endif

" load plugin pathogen, need turn filetype off
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
set background=dark

" Save the folders
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

filetype indent plugin on
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set nobackup		" DON'T keep a backup file

set history=50		" keep 50 lines of command line history
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set incsearch		" do incremental searching
set tabstop=4
set expandtab 		" prints 4 space characters instead of tab character
set softtabstop=4 	" delete 4 spaces in a row

set number				" line numbers
set autoindent
set mouse=a				" use mouse in xterm to scroll
set scrolloff=3 		" 5 lines bevore and after the current line when scrolling
set ignorecase			" ignore case
set smartcase			" but don't ignore it, when search string contains uppercase letters
set hid 				" allow switching buffers, which have unsaved changes
set shiftwidth=4		" 4 characters for indenting
set showmatch			" showmatch: Show the matching bracket for the last ')'?

set nowrap				" don't wrap by default
syn on
set completeopt=menu,longest,preview

set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'


" enable php and html snippets
au BufRead,BufNewFile *.php set filetype=php.html

" enable matchit (plugin that founds matching tags)
let loaded_matchit = 1

" « v,d » cherche la définition du mot courant dans le TLFI
vmap ,d :call OpenWebBrowser("http://www.cnrtl.fr/lexicographie/<C-R><C-W>")<CR>
" « v,s » cherche les synonymes du mot courant dans le TLFI
vmap ,s :call OpenWebBrowser("http://www.cnrtl.fr/synonymie/<C-R><C-W>")<CR>
" « v,g » cherche le mot courant dans Google
vmap ,g :call OpenWebBrowser("http://www.google.fr/search?hl=fr&q=<C-R><C-W>&btnG=Recherche+Google&meta=")<CR>
" « v,c » cherche le mot courant dans le conjugueur
vmap ,c :call OpenWebBrowser("http://www.leconjugueur.com/php5/index.php?v=<C-R><C-W>")<CR>
" « v,w » cherche le mot courant Wikipedia
vmap ,w :call OpenWebBrowser("http://fr.wikipedia.org/wiki/<C-R><C-W>")<CR>
" ouvre l’URL sur laquelle on se trouve
vmap ,o :call OpenWebBrowser("<C-R><C-A>")<CR>

" Map les touches du bépo en qwerty en mode normal si clavier en bepo
"set langmap=ba,éz,pe,or,èt,çy,vu,di,lo,jp,j^,z$,aq,us,id,ef,\,g,ch,tj,sk,rl,nm,mù,ç*,ê<,àw,h:,yc,.v,kb,'n,q\,,g;;,x:,w$,BA,ÉZ,PE,OR,ÈT,ÇY,VU,DI,LO,FP,J¨,Z£,AQ,US,ID,EF,?G,CH,TJ,SK,NL,RM,M%,!*,Ê>,ÀW,HX,YC,:V,KB,\\;N,QG,G.,X/,W§,@œ,_&,"é,«",»',((,)-,+è,-_,*ç,/à,=),%=,$Œ,^°,µ+,#“,{´,}~,<#,>{,[[,]|,±`,¬\,×^,÷@,¯],%}
source /home/vincent/.dotfiles/vim/.vimrc.bepo

"Code folding
set foldmethod=indent
set foldlevel=4

"Task list
map <leader>td <Plug>TaskList

" Easy access to revision history
map <leader>f :GundoToggle<CR>

let g:pep8_map='<leader>8'


" tab completion and documentation
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview


" When editing a file, always jump to the last known cursor position.
"Don't do it when the position is invalid or when inside an event handler
"(happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif

" vim-django settings
let g:django_projects = '~'

" tagbar
let g:tagbar_usearrows = 1

" TList setup
let Tlist_Inc_Winwidth = 0
let Tlist_File_Fold_Auto_Close = 1

" enable txt2tags syntax and comands
au BufNewFile,BufRead *.t2t     setf txt2tags|set noexpandtab
" keep tab chars in t2t for quoted paragraphs
" autocmd FileType txt2tags set noexpandtab


autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


" Solarized theme
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized


" CloseTag
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

" LESS syntax highlight
nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>

" prevent listing some file types
set wildignore+=*.pyc,*.jpg,*.png,*.pdf

" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import os
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

silent! source ~/.vimrc.local
