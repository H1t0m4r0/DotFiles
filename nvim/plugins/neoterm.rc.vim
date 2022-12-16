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
" nnoremap <silent> <leader>f :Topen<CR><C-l><C-\><C-n>
