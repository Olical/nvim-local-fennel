local _2afile_2a = "fnl/nvim-local-fennel/init.fnl"
local _2amodule_name_2a = "nvim-local-fennel.init"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("nvim-local-fennel.aniseed.autoload")).autoload
local a, compile, nvim = autoload("nvim-local-fennel.aniseed.core"), autoload("nvim-local-fennel.aniseed.compile"), autoload("nvim-local-fennel.aniseed.nvim")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["compile"] = compile
_2amodule_locals_2a["nvim"] = nvim
local function cwd()
  return nvim.fn.getcwd()
end
_2amodule_locals_2a["cwd"] = cwd
local function parent(dir)
  local candidate = nvim.fn.fnamemodify(dir, ":h")
  if ((dir ~= candidate) and nvim.fn.isdirectory(candidate)) then
    return candidate
  else
    return nil
  end
end
_2amodule_locals_2a["parent"] = parent
local function parents(dir)
  local result = {}
  local dir0 = parent(dir)
  while dir0 do
    table.insert(result, 1, dir0)
    dir0 = parent(dir0)
  end
  return result
end
_2amodule_locals_2a["parents"] = parents
local function file_readable_3f(path)
  return (1 == nvim.fn.filereadable(path))
end
_2amodule_locals_2a["file-readable?"] = file_readable_3f
local function file_newer_3f(a0, b)
  return (nvim.fn.getftime(a0) > nvim.fn.getftime(b))
end
_2amodule_locals_2a["file-newer?"] = file_newer_3f
local cwd0 = cwd()
local dirs = parents(cwd0)
table.insert(dirs, cwd0)
local function _2_(dir)
  local src = (dir .. "/.lnvim.fnl")
  local dest = (dir .. "/.lnvim.lua")
  if file_readable_3f(src) then
    if file_newer_3f(src, dest) then
      compile.file(src, dest)
    else
    end
    return nvim.ex.luafile(dest)
  else
    if file_readable_3f(dest) then
      return nvim.fn.delete(dest)
    else
      return nil
    end
  end
end
return a["run!"](_2_, dirs)