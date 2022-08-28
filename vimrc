""""""""""""" basic
set nocompatible
filetype off
filetype plugin indent on
set ttyfast
set ttymouse=xterm2
set ttyscroll=3
set laststatus=2
set encoding=utf-8
syntax enable
syntax on
"tab宽度和缩进设置
set tabstop=4
set softtabstop=4
set shiftwidth=4
"兼容老版本
set backspace=indent,eol,start
set noswapfile
set nobackup
set hidden
"自动缩紧和对齐
set autoindent
set smartindent
"开启追踪列表选择
set cscopetag
set incsearch
set hlsearch
"默认显示行号
set number
set ruler
set si

 
""""""""""""" theme
"molokai设置
set t_Co=256
let g:molokai_original = 1 
let g:rehash256 = 1 
if (has("termguicolors"))
  set termguicolors
endif
colorscheme one
"colorscheme molokai
"colorscheme gotham
"colorscheme flattened_dark
set background=dark



""""""""""""" plugin
call plug#begin('~/.vim/plugged')
	"theme
    Plug 'whatyouhide/vim-gotham'
    Plug 'mhartington/oceanic-next'
	"tagbar
    Plug 'scrooloose/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'vim-airline/vim-airline'
    Plug 'majutsushi/tagbar'
	"git
	Plug 'airblade/vim-gitgutter'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'zivyangll/git-blame.vim'
    Plug 'tpope/vim-fugitive'
	"align
    Plug 'junegunn/vim-easy-align'
    Plug 'dkprice/vim-easygrep'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'scrooloose/nerdcommenter'
	"motion
    Plug 'Lokaltog/vim-easymotion'
	"search
	Plug 'liuchengxu/vim-which-key'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'ivalkeen/vim-ctrlp-tjump' 
    Plug 'fisadev/vim-ctrlp-cmdpalette'
    Plug 'tacahiroy/ctrlp-funky'
    "term
	Plug 'voldikss/vim-floaterm'
	"translator
    Plug 'ianva/vim-youdao-translater'
	"language
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	"Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()

 
let g:mapleader = '\'

""""""""""""" floaterm
"tnoremap <esc> <C-\><C-N>

nnoremap   <Leader>wm   :FloatermNew --height=0.1 --width=0.2 --wintype=float --name=floaterm1 --position=bottomright<CR>
nnoremap   <Leader>wr   :FloatermNew --height=0.6 --width=0.4 --wintype=float --name=ft1 --position=topleft --autoclose=2 ranger --cmd="cd ~"<CR>
nnoremap   <Leader>wg   :FloatermNew --height=0.8 --width=0.8 --name=lazygit lazygit<CR>
nnoremap   <silent>   '<Leader>ww'   :FloatermNew<CR>
tnoremap   <silent>   '<Leader>ww'   :<C-\><C-n>:FloatermNew --name=shell<CR>
nnoremap   <silent>   '<Leader>wt'   :FloatermToggle<CR>
tnoremap   <silent>   '<Leader>wt'   :<C-\><C-n>:FloatermToggle<CR>
nnoremap   <silent>   '<Leader>wp'   :FloatermPrev<CR>
tnoremap   <silent>   '<Leader>wp'   :<C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   '<Leader>wn'   :FloatermNext<CR>
tnoremap   <silent>   '<Leader>wn'   :<C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   '<Leader>wq'   :FloatermKill<CR>
tnoremap   <silent>   '<Leader>wq'   :<C-\><C-n>:FloatermKill<CR>
nnoremap   <Leader>wk   :FloatermKill!<CR>
tnoremap   <Leader>wk   :<C-\><C-n>:FloatermKill!<CR>

let g:floaterm_keymap_new = '<Leader>ww'
let g:floaterm_keymap_toggle = '<Leader>wt'
let g:floaterm_keymap_prev = '<Leader>wp'
let g:floaterm_keymap_next = '<Leader>wn'
let g:floaterm_keymap_kill = '<Leader>wq'




"let g:terminal_key = '≠'
"

"let s:cmd = 'nnoremap <silent>'.(g:terminal_key). ' '
"exec s:cmd . ':ter ++rows=10<cr>'


"set tags+=/home/sunsong/go/src/tags

"if has('unnamedplus')
  "set clipboard^=unnamed
  "set clipboard^=unnamedplus
"endif


"set history=700
"set fenc=utf-8
"set fileencodings=utf-8,gbk,cp936,latin-1
"hi Search term=standout ctermfg=0 ctermbg=3 guifg=Black guibg=Yellow
au InsertLeave *.eml write
"let g:one_allow_italics = 1
"set expandtab
"set si

let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader>eh <Plug>(easymotion-linebackward)
map <Leader>ej <Plug>(easymotion-j)
map <Leader>ek <Plug>(easymotion-k)
map <Leader>el <Plug>(easymotion-lineforward)
map <Leader>es <Plug>(easymotion-s)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader>e. <Plug>(easymotion-repeat)
let g:EasyMotion_startofline = 0

" git
nmap <Leader>gs :<C-u>call gitblame#echo()<CR>

nmap <Leader>g( <Plug>(GitGutterPrevHunk)
nmap <Leader>g) <Plug>(GitGutterNextHunk)

"map <C-L> :Tlist<CR>
"map <C-D> :GoDoc<CR>
"map <C-I> :GoImports<CR>

map <C-N> :NERDTreeToggle<CR>
map <C-O> :TagbarToggle<CR>

" 标签页
nnoremap <S-h> :tabp<CR>
nnoremap <S-l> :tabn<CR>
nnoremap <S-o> :tabo<CR>
nnoremap <S-c> :tabc<CR>

" fzf
nnoremap <Leader>sf :Files<CR>
nnoremap <Leader>sb :Buffers<CR>
nnoremap <Leader>sl :Lines<CR>
nnoremap <Leader>sc :Colors<CR>
nnoremap <Leader>sh :History<CR>


let NERDTreeQuitOnOpen=1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Use_Right_Window=1
let Tlist_Close_On_Select=1
let Tlist_Show_Menu=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Ctags_Cmd ='ctags'
let g:go_disable_autoinstall = 0
let g:neocomplete#enable_at_startup = 1
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  : '✹',
    \ 'Staged'    : '✚',
    \ 'Untracked' : '✭',
    \ 'Renamed'   : '➜',
    \ 'Unmerged'  : '═',
    \ 'Deleted'   : '✖',
    \ 'Dirty'     : '✗',
    \ 'Clean'     : '✔︎',
    \ 'Unknown'   : '?'
    \ }



""""""""""""" tools
" source ~/.vimrc
nnoremap <S-u> :source ~/.vimrc<CR>

"有道
vnoremap <silent> <C-Y> :<C-u>Ydv<CR>
nnoremap <silent> <C-Y> :<C-u>Ydc<CR>
noremap <leader>yd :<C-u>Yde<CR>


"let g:ctrlp_map = '<leader>sp'
"let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

" 多光标
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-l>'
let g:multi_cursor_select_all_word_key = '<A-l>'
let g:multi_cursor_start_key           = 'g<C-l>'
let g:multi_cursor_select_all_key      = 'g<A-k>'
let g:multi_cursor_next_key            = '<C-l>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" which key
nnoremap <silent> <leader>      :<c-u>WhichKey '\'<CR>


let g:which_key_map = {}
let g:which_key_map['<Leader>'] = 'which_key_ignore'

let g:which_key_map.w = { 'name' : '+window' }
let g:which_key_map.w.m = '(new)mini shell'
let g:which_key_map.w.g = '(new)lazygit'
let g:which_key_map.w.r = '(new)ranger'
let g:which_key_map.w.w = '(new)shell'
let g:which_key_map.w.t = 'open/hide'
let g:which_key_map.w.p = 'prev'
let g:which_key_map.w.n = 'next'
let g:which_key_map.w.k = 'kill'
let g:which_key_map.g = { 'name' : '+git' }
let g:which_key_map.g.s = 'blame'
let g:which_key_map.g["("] = 'prev hunk'
let g:which_key_map.g[")"] = 'next hunk'
let g:which_key_map.s = { 'name' : '+search' }
let g:which_key_map.s.f = 'files'
let g:which_key_map.s.b = 'buffers'
let g:which_key_map.s.l = 'lines'
let g:which_key_map.s.h = 'history'
let g:which_key_map.s.c = 'colors'
let g:which_key_map.e = { 'name' : '+easymotion' }
let g:which_key_map.f = 'files'
let g:which_key_map.c = { 'name' : '+comment' }

call which_key#register('\', "g:which_key_map")

nmap <C-J> 15j
nmap <C-K> 15k



""""""""""""" lsp
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:coc_global_extensions=[
    \'coc-vimlsp',
    \'coc-marketplace']

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
" color
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

"augroup go
  "autocmd!
  "autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  "autocmd FileType go nmap <Leader>w <Plug>(go-def-split)
"augroup END

"let g:syntastic_mode_map = {'mode': 'active', 'passive_filetypes': ['go', 'java'] }


