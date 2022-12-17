" vimrcと共存
source ~/.vimrc

"カラースキームを変更
colorscheme ghdark


" --------------------- 以下vim-plugの設定 -------------------

" vim-plugがインストールされていなければ、自動でインストール
if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif


" 以下vimのプラグイン
call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'kassio/neoterm'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/vim-plug',{'dir': '~/.vim/plugged/vim-plug/autoload'}
  Plug 'rust-lang/rust.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" ------------------- 以下プラグインのキー割り当て設定 ---------------------

" fzf & fzf.vim
nnoremap <leader>f :<C-u>Files<CR>
nnoremap <leader>b :<C-u>Buffers<CR>

" neoterm
let g:neoterm_default_mod='belowright'
" ターミナルウィンドウサイズの変更
let g:neoterm_size = winheight(0)/3
augroup AutoTermHeight
  autocmd!
  autocmd VimResized * let g:neoterm_size = winheight(0)/3
augroup END
" ターミナルウィンドウのトグル設定
nnoremap <silent> <C-t><C-t> :Ttoggle<CR>zz
tnoremap <silent> <C-t><C-t> <C-\><C-n>:Ttoggle<CR>zz
tnoremap <silent> <ESC> <C-\><C-n>
nnoremap <silent> <leader>t :Topen<CR><C-w><C-j>i
" 上のウィンドウに移動 <C-w>k
" 下のウィンドウに移動 <C-w>j
" 右のウィンドウに移動 <C-w>l
" 左のウィンドウに移動 <C-w>h
" ターミナルを抜ける <C-w><C-w>
"
" coc.nvim
" autocomplete
inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
inoremap <silent><expr> <Enter> coc#pum#visible() ? coc#pum#confirm() : "\<Enter>"
inoremap <silent><expr> <Esc> coc#pum#visible() ? coc#pum#cancel() : "\<Esc>"
inoremap <silent><expr> <C-h> coc#pum#visible() ? coc#pum#cancel() : "\<C-h>"
