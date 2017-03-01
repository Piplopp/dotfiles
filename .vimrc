" Thanks to aluriak for his .vimrc

if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif




" -------------------------
" Bundles time !
" -------------------------
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" Indentation -----
    " PEP8 indent
    NeoBundle 'hynek/vim-python-pep8-indent'

    " indent lines
    NeoBundle 'Yggdroot/indentLine'

" Languages syntax -----
    " Python
    NeoBundle 'kh3phr3n/python-syntax'
" Languages forge -----
    " markdown support
    NeoBundle 'tpope/vim-markdown'

" Miscs -----
    " coloured and efficient HUI (sooo sexy)
    NeoBundle 'bling/vim-airline'

    " airline theme (moooooooore sexyness)
    NeoBundle 'vim-airline/vim-airline-themes'

    " Git support
    NeoBundle 'tpope/vim-fugitive'

    " Multiple line insertion
    NeoBundle 'terryma/vim-multiple-cursors'

    " tagbar (need ctags)
    NeoBundle 'majutsushi/tagbar'

    " File explorator (need unite)
    NeoBundle 'Shougo/vimfiler.vim'

    " Complementation (synergies: vimshell, unite) (hail this plugin)
    NeoBundle 'Shougo/neocomplcache.vim'

    " snippets (synergies: neocomplcache)
    NeoBundle 'Shougo/neosnippet'
    NeoBundle 'Shougo/neosnippet-snippets'

    " necessary for efficiency Unite, with options for automatize compilation
    NeoBundle 'Shougo/vimproc.vim', {
        \ 'build' : {
        \     'windows' : 'tools\\update-dll-mingw',
        \     'cygwin' : 'make -f make_cygwin.mak',
        \     'mac' : 'make -f make_mac.mak',
        \     'linux' : 'make',
        \     'unix' : 'gmake',
        \    },
    \ }

    " Because needed by vimfile
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'bronson/vim-visual-star-search'

    " Terminal in vim (need Unite)
    NeoBundle 'Shougo/vimshell.vim'

    " easy comments (take from friends)
    NeoBundle 'aluriak/nerdcommenter'

    " lines of same indentation as text objects
    NeoBundle 'michaeljsmith/vim-indent-object'

    " Complete abbreviations and research
    NeoBundle 'tpope/vim-abolish'

    " vim bookmarks
    NeoBundle 'MattesGroeger/vim-bookmarks'

    " subvertion with {} and coercition
    NeoBundle 'tpope/vim-abolish'

    " Repeat whole maps
    NeoBundle 'tpope/vim-repeat'

    " dates management
    NeoBundle 'tpope/vim-speeddating'

    " vim autopairs
    NeoBundle 'jiangmiao/auto-pairs'

    " vim tabularize
    NeoBundle 'godlygeek/tabular'





" Configuration indent line
let g:indentLine_char = '|'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
"NeoBundleClean
NeoBundleCheck

" neobundle initialization terminated
" vimrc begin here
" -------------------------
" END Bundles
" -------------------------






""""""""""""""""""""""""
" VIMRC : FROM ALURIAK "
""""""""""""""""""""""""
"set colorscheme
colorscheme mustang


" Some random stuff from Aluriak
" --------------------------------
" pour que l'indentation avec tab soit la même qu'avec les chevrons
set shiftwidth=4        "indentation = N cases
set smarttab            "chevrons équivalent à la touche tab
set nu                  "affichage des numéros de ligne
set autoindent          "indentation gardée après saut de ligne
set expandtab           "pas de tab, uniquement des espaces

" Mark efficiently tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" Details
set nomodeline          " security about modelines
set cm=blowfish         " Encryption : use of Blofish algorithm
set mouse=a             " mouse for all modes
set pastetoggle=<F10>   " Use <F10> to toggle between 'paste' and 'nopaste'
set wildmenu            " Better command-line completion




" Configure bundles
" -------------------
" Status line
set statusline=%{fugitive#statusline()}\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
set laststatus=2

" airline setup
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
set noshowmode
"to fix the font and lot of strange characters and colors
let g:airline_theme='wombat'
set encoding=utf-8
set t_Co=256
"set fillchars+=stl:\ ,stlnc:\

" session manager have the default comportement, except that is not save the
" local and global mappings/options.
set sessionoptions=blank,buffers,sesdir,winpos,folds,help,tabpages,winsize

" Abolish
cabbrev S Subvert
nmap lr <Plug>Coerce

" TagBar toggle window
nmap <F8> :TagbarToggle<CR>

" Remap and shortcuts for vim-bookmarks
nmap ®® <Plug>BookmarkToggle
nmap ®i <Plug>BookmarkAnnotate
nmap ®o <Plug>BookmarkAnnotate TODO<cr>
nmap ®a <Plug>BookmarkShowAll
nmap ®þ <Plug>BookmarkNext
nmap ®ß <Plug>BookmarkPrev
nmap ®c <Plug>BookmarkClear
nmap ®d <Plug>BookmarkClear
nmap ®x <Plug>BookmarkClearAll
let g:bookmark_auto_save_file="/home/jerome/.vim/vim-bookmarks"
"Enables line centering when jumping to bookmark
let g:bookmark_center = 1
"color of sign column
highlight SignColumn ctermbg=NONE
highlight BookmarkSign ctermbg=NONE ctermfg=LightGreen

" vimfiler module definitions
let g:vimfiler_as_default_explorer = 1

" For multiple cursors :
let g:multi_cursor_exit_from_insert_mode = 0 " don't quit with escape in insert mode
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Unite
nnoremap <C-f> :Unite file_rec/async<cr>
nnoremap <space>/ :Unite grep:.<cr>

" Syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
" error in source code highlighted in blue
highlight SyntasticError        ctermbg=blue ctermfg=NONE
highlight SyntasticWarning      ctermbg=blue ctermfg=NONE
" sign in sign column are in red and yellow
highlight SyntasticErrorSign    cterm=bold ctermbg=NONE ctermfg=red
highlight SyntasticWarningSign  ctermbg=NONE ctermfg=yellow
" current line in error buffer is highlighted in blue
highlight Search                ctermbg=blue ctermfg=NONE

" Snippets
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<TAB>"
" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

" remappages importants
let mapleader = ","

"Abbréviations d'ordre générales
ab actual source ~/.vimrc
ab tq tabclose

" déplacement haut-bas
noremap <S-s> 50k
noremap <S-t> 50j
noremap <S-up> 50k
noremap <S-down> 50j

" Fx assigns
noremap <F1> :TlistToggle<cr> 
noremap <F2> :VimFilerBuffer<cr> 
noremap <F4> :VimShellTab<cr>
noremap <F6> :Gstatus<cr> 
noremap <F7> :Gcommit<cr> 
noremap <F9> :VimShellInteractive make<cr>

" paste (before|after) and leave cursor at the beginning 
noremap œ P`[
noremap Œ p`[
" write only one character (before|after) cursor [DONT WORK ?]
noremap <leader>i i?<Esc>h 
noremap <leader>a a?<Esc>h 

" Modif selon type de fichier
filetype plugin indent on       "Indentation selon extension de fichier (nécessaire pour vundle)
syntax on                       "affichage des couleurs
au BufNewFile,BufRead *.pde setf arduino
au BufNewFile,BufRead *.mkd setf mkd
au BufNewFile,BufRead *.adb setf ada*/
au BufNewFile,BufRead *.ads setf ada*/
au BufNewFile,BufRead *.py  setf python 
au BufNewFile,BufRead *.tex set encoding=utf-8
au BufNewFile,BufRead *.rb set shiftwidth=2
au BufNewFile,BufRead {M,m}akefile set noexpandtab

" Delete ~/.vim/.netrwhist file after generation
au VimLeave * if filereadable("~/.vim/.netrwhist") | call delete("~/.vim/.netrwhist") | endif 

" NEOCOMPLCACHE settings
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_max_list = 20

" Enable heavy features.
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Use delimiter completion.
let g:neocomplcache_enable_auto_delimiter = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() 
    return neocomplcache#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode (Not recommended)
inoremap <expr><Left> neocomplcache#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
inoremap <expr><Up> neocomplcache#close_popup() . "\<Up>"
inoremap <expr><Down> neocomplcache#close_popup() . "\<Down>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Highlight carac past column 80
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python highlight Excess guibg=Green ctermbg=Grey
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
augroup END

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" Delete ~/.vim/.netrwhist file after generation
au VimLeave * if filereadable("~/.vim/.netrwhist") | call delete("~/.vim/.netrwhist") | endif 

