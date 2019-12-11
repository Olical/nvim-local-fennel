local core = require("nvim-local-fennel.aniseed.core")
local nvim = require("nvim-local-fennel.aniseed.nvim")
local function basename(path)
  return nvim.fn.fnamemodify(path, ":h")
end
local function mkdirp(dir)
  return nvim.fn.mkdir(dir, "p")
end
return {["aniseed/module"] = "nvim-local-fennel.aniseed.fs", basename = basename, mkdirp = mkdirp}
