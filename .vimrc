set ai!
set rnu
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set cursorline
set wildmenu
syntax enable

"Sets clipboard as shared between X session and Vim
set clipboard^=unnamed


"Key maps
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

:command WQ wq
:command Wq wq
:command W w
:command Q q
:nmap j gj
:nmap k gk
:nmap <Space> <Leader>
:nmap <Space>w :w<CR>


"Addons
execute pathogen#infect()


"Unite settings
nnoremap <Leader>f :Unite -start-insert -auto-resize file/async<CR>
nnoremap <Leader>t :Unite -start-insert -auto-resize file_rec/async<CR>
nnoremap <Leader>e :Unite -auto-resize buffer<CR>
nnoremap <Leader>/ :Unite -auto-resize grep:.<CR>
let g:unite_source_history_yank_enable = 1
nnoremap <Leader>y :Unite -auto-resize history/yank<CR>
nnoremap <Leader>r :Unite -auto-resize file_mru<CR>


"Gundo Settings
nnoremap <Leader>u :GundoToggle<CR>
let g:gundo_close_on_revert = 1
set undodir=~/.vim/tmp/undo
set undofile
set history=64
set undolevels=64


"gvim options
set guifont=Tamzen\ 13
colorscheme gotham256
:set guioptions-=T "removes toolbar
:set guioptions-=r "removes right-hand scrollbar
:set guioptions-=m "removes menu bar
:set guiheadroom=0
:set expandtab


"setups up comment type per filetype for commentary
autocmd FileType python set commentstring=#\ %s
autocmd FileType sh set commentstring=#\ %s
autocmd FileType c set commentstring=//\ %s
autocmd FileType cpp set commentstring=//\ %s
autocmd FileType java set commentstring=//\ %s
autocmd FileType javascript set commentstring=//\ %s
autocmd FileType css set commentstring=/*\ %s\ */
autocmd FileType vim set commentstring=\"\ %s
autocmd FileType html set commentstring=<!--\ %s\ -->


" Only show quick-scope highlights after f/F/t/T is pressed
function! Quick_scope_selective(movement)
    let needs_disabling = 0
    if !g:qs_enable
        QuickScopeToggle
        redraw
        let needs_disabling = 1
    endif

    let letter = nr2char(getchar())

    if needs_disabling
        QuickScopeToggle
    endif

    return a:movement . letter
endfunction

let g:qs_enable = 0

for i in  [ 'f', 'F', 't', 'T' ]
    execute 'noremap <expr> <silent>' . i . " Quick_scope_selective('". i . "')"
endfor
