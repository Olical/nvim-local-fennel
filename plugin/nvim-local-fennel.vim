let s:deps = expand('<sfile>:p:h') . "../deps"
set runtimepath += s:deps
lua require("nvim-local-fennel")
set runtimepath -= s:deps
