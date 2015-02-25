"force NERDTree to open tabs at the end of current tabs
if exists('b:haveRemappedT')
    finish
endif
let b:haveRemappedT=1
let s:oldmap=maparg('T', 'n')
function! s:LastTab()
    let tab=tabpagenr()
    tabnext
    execute "tabmove ".tabpagenr('$')
    execute "tabn ".tab
endfunction
execute 'nnoremap <buffer> T '.s:oldmap.':call <SID>LastTab()<CR>'
