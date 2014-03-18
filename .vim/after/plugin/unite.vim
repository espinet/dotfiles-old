call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

noremap <leader>uf :<C-u>Unite -start-insert file_rec<Enter>
noremap <leader>ub :<C-u>Unite  buffer<Enter>
