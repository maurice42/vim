" vimrc pour windows

"------------------------------------------------------------------------------
" General
set nocompatible                        " Utilise les defauts Vim (bien mieux !)

"------------------------------------------------------------------------------
" Use pathogen to manage plugins
execute pathogen#infect()

" ----- Coloration -----
syntax on                               " coloration syntaxique
colorscheme torte                       " style de coloration
filetype on                             " pour que vim detecte le type de fichier courant
set nu                                  " affiche le num de la ligne
set cursorline                          " surligne la ligne courante
hi Normal       guifg=Grey70
hi StatusLine   guifg=#404040   font=Consolas:h10:cANSI:
hi LineNr       guifg=DarkGrey  font=Consolas:h10:cANSI:
hi CursorLine   guibg=#3f3f3f
hi Cursor       guibg=#707070   guifg=#d0d0d0
hi Search       guibg=#aa0000
hi MatchParen   guibg=DarkGreen
hi Folded       guibg=Black     guifg=DarkGrey
hi PMenu        guibg=#222222
hi texError     guibg=Black
" hi Todo         guibg=DarkYellow guifg=DarkGreen
hi Comment      guifg=#00b000
set colorcolumn=120
hi ColorColumn  guibg=#202020


" ----- Autocompletion -----
set complete=.


" ----- Tabulations -----
set tabstop=4                           " tab = 4 spaces
set shiftwidth=4                        " tab = 4 spaces
set expandtab                           " utilise tjrs des espaces lors d'un tab
" set autoindent                          " toujours utiliser l'autoindentation


" ----- Recherches -----
set hlsearch                            " coloration de la derniere chaine recherchee
set ignorecase                          " ignore la case pendant la recherche
set smartcase                           " ignore la case pendant la recherche
" REDEFINITION DE RACCOURCI : F3 pour enlever/remettre la coloration de la derniere recherche
nnoremap <F3> :set hlsearch!<CR>


" ----- Font -----
set guifont=Courier_New:h10:b:cANSI:    " Pour retrouver la bonne fonte qui va bien


" ----- Customize gui -----
set lines=55                            " taille fenetre: 50 lignes
set columns=200                         " 130 colonnes
set guioptions-=T                       " remove toolbar in gvim
set guioptions-=m                       " remove menubar in gvim
set laststatus=2                        " Statusline : affiche la statusline comme 2eme line
set statusline=%F%m%=%y[%l/%L;%c]\ %p%% " Statusline : donne: chemin/du/fichier, modified flag, line number, line total, percent
set guitablabel=%t%m                    " Onglets : label pour les onglets. Nom du fichier et + si modif
set wildmenu                            " Use the cool tab complete command menu
" set wildmode=list:longest,full          " Use the cool tab complete command menu

" ----- Gestion des onglets -----
" REDEFINITION DE RACCOUCI
"   - Ctrl-tab pour changer d'onglet
"   - Ctrl-w pour fermer l'onglet courant
"   - Ctrl-o pour ouvrir un fichier dans un nouvel onglet (ouvre un explorateur de fichiers, lent)
"   - Alt-o pour ouvrir le fichier cpp/h associe sur un split droit (plugin FSwitch)
nnoremap <C-T> :tabnew<CR>
nnoremap <C-W> :tabclose<CR>
nnoremap <C-O> :browse tabnew<CR>
nnoremap <M-o> :FSSplitRight<CR>

" ----- Amieliore l'integration dans windows -----
set dir=$TMP                            " utilise le dossier temp de windows
" REDEFINITION DE RACCOURCI
"   utilise le presse papier windows par defaut pour copier/coller.
nnoremap p "+p
nnoremap y "+y
nnoremap dd "+dd
nnoremap yy "+yy
nnoremap Y "+yy
vnoremap p "+p
vnoremap y "+y
vnoremap d "+d
vnoremap x "+x


" ----- Simplifie l'edition du vimrc -----
" REDEFINITION DE RACCOURCI
"   - utilise , au lieu de \ comme caractere special (pour definir des custom command)
"   - utilise ,ev pour editer le vimrc (comme Edit Vimrc)
"   - utilise ,sv comme Source Vimrc
let mapleader = ","
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" REDEFINITION DE RACCOURCI
"   - alt-up/down pour monter/descendre la ligne courante
"   - alt-up/down pour monter/descendre le bloc selectionne
nnoremap <A-Up>   :m-2<CR>
nnoremap <A-Down> :m+<CR>
vnoremap <A-Up>   :m-2<CR>gv=gv
vnoremap <A-Down> :m'>+<CR>gv=gv
nnoremap <F5> :e!<CR>
" ,tw pour supprimer les trailing whitespace en fin de ligne
:nnoremap <silent> <leader>tw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" utilise (( et )) pour naviger d'une fonction a l'autre
nnoremap (( [[
nnoremap )) ]]



" ----- Sessions managements -----
:set sessionoptions+=resize     " Save size of window (lines and columns) in session
:set sessionoptions+=winpos     " Save windows positions in session
" REDEFINITION DE RACCOURCI
"   F6-F8 Reserve these keys to session management
nnoremap <F6> :source F:/Utilities/autoTestsQA.vim<CR>
nnoremap <F7> :source F:/Utilities/autoTestsCustomPython.vim<CR>
nnoremap <F8> :source F:/Utilities/autoTestsNdt.vim<CR>


" ----- Plugin NERDTree configuration -----
" REDEFINITION DE RACCOURCI
"   F9 pour lancer NERDTree (explorateur de fichier)
nnoremap <silent> <F9> :NERDTreeToggle<CR>

"------------------------------------------------------------------------------
" EN VRAC
set scrolloff=3                 " 3 lignes avant/apres le cursor quand on scroll

set whichwrap=b,s,<,>,[,]       " continue au debut de la ligne suivante quand on arrive en fin de ligne
set backspace=2                 " autorise l'effacement de tout en mode insertion, same as :set backspace=indent,eol,start
set foldmethod=indent           " replier le texte (folding) manuelement (zf)
set foldlevelstart=30           " ouvre tout les fold par defaut
set autochdir                   " Automatically go in the right dir when open file
set browsedir=current           " working directory is the current file directory
set undofile                    " allow persistent undo (save undo when file is closed)
set undodir=$TMP                " direcory where is saved undofiles




"------------------------------------------------------------------------------
" associe les *.toto a la syntax toto. Le fichier de syntaxe doit se trouver dans vimfile/syntax
au BufRead,BufNewFile *.scro    set filetype=tcl
au BufRead,BufNewFile *.qss     set filetype=css
au BufRead,BufNewFile *.hx      set filetype=tcl
au BufRead,BufNewFile Package   set filetype=tcl
au BufRead,BufNewFile *.vcxproj set filetype=xml
au BufRead,BufNewFile *.doc     set filetype=tex
au BufRead,BufNewFile *.frag    set filetype=glsl
au BufRead,BufNewFile *.vert    set filetype=glsl
au BufRead,BufNewFile *.glsl    set filetype=glsl
au BufRead,BufNewFile *.pyscro  set filetype=python




