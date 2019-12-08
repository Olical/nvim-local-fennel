let s:deps = expand('<sfile>:p:h') . "../lua/nvim-local-fennel/deps"
set runtimepath += s:deps
lua require("nvim-local-fennel")
set runtimepath -= s:deps
