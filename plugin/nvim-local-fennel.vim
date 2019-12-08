let s:deps = expand("<sfile>:p:h") . "/../deps"
let s:original_rtp = &runtimepath
let &runtimepath .= "," . s:deps
lua require("nvim-local-fennel")
let &runtimepath = s:original_rtp
