
nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr>



" function! GrepOperator(type)
"     echom "Test"
"     echom a:type
" endfunction



" function! GrepOperator(type)
" if a:type ==# 'v'
"     execute "normal! `<v`>y"
" elseif a:type ==# 'char'
"     execute "normal! `[v`]y"
" else
"     return
" endif
" echom @@
" endfunction

function! GrepOperator(type)
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif
    echom shellescape(@@)
endfunction


