local compile = require("aniseed.compile")
local nvim = require("aniseed.nvim")
local core = require("aniseed.core")
local function cwd()
  return nvim.fn.getcwd()
end
local function parent(dir)
  local candidate = nvim.fn.fnamemodify(dir, ":h")
  if ((dir ~= candidate) and nvim.fn.isdirectory(candidate)) then
    return candidate
  end
end
local function parents(dir)
  local result = {}
  local dir = parent(dir)
  while dir do
    table.insert(result, 1, dir)
    dir = parent(dir)
  end
  return result
end
local function file_readable_3f(path)
  return (1 == nvim.fn.filereadable(path))
end
local function _0_(...)
  local cwd = cwd()
  local dirs = parents(cwd)
  table.insert(dirs, cwd)
  local function _1_(dir)
    local src = (dir .. "/.lnvim.fnl")
    local dest = (dir .. "/.lnvim.lua")
    if file_readable_3f(src) then
      compile.file(src, dest)
      return nvim.ex.luafile(dest)
    else
      if file_readable_3f(dest) then
        return nvim.fn.delete(dest)
      end
    end
  end
  return core["run!"](_1_, dirs)
end
_0_(...)
              -- (vim.api.nvim_set_option runtimepath (.. (vim.api.nvim_get_option runtimepath) , (vim.api.nvim_call_function getcwd table: 0x40ba3488)))
return {["aniseed/module"] = "nvim-local-fennel.init"}