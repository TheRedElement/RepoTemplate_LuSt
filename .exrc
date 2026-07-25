" local keymappings and commands

" quick executions
nnoremap <leader>x1 :execute '!uv run ' . fnameescape(GitRoot() . '/main.py')<CR>   " runs `<repo_root>/main.py` using uv
