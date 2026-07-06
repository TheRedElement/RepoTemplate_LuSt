" local keymappings and commands

" quick executions
nnoremap <leader>x0 :execute '!uv run %'<CR>                                        " runs current file using uv
"nnoremap <leader>x0 :execute '!python3 run %'<CR>                                   " runs current file using python
"nnoremap <leader>x0 :execute '!julia --project=. %'<CR>                             " runs current file using julia
nnoremap <leader>x1 :execute '!uv run ' . fnameescape(GitRoot() . '/main.py')<CR>   " runs `<repo_root>/main.py` using uv
