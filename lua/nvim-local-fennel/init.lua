local _2afile_2a = "fnl/nvim-local-fennel/init.fnl"
local _0_
do
  local name_0_ = "nvim-local-fennel.init"
  local module_0_
  do
    local x_0_ = package.loaded[name_0_]
    if ("table" == type(x_0_)) then
      module_0_ = x_0_
    else
      module_0_ = {}
    end
  end
  module_0_["aniseed/module"] = name_0_
  module_0_["aniseed/locals"] = ((module_0_)["aniseed/locals"] or {})
  do end (module_0_)["aniseed/local-fns"] = ((module_0_)["aniseed/local-fns"] or {})
  do end (package.loaded)[name_0_] = module_0_
  _0_ = module_0_
end
local autoload
local function _1_(...)
  return (require("nvim-local-fennel.aniseed.autoload")).autoload(...)
end
autoload = _1_
local function _2_(...)
  local ok_3f_0_, val_0_ = nil, nil
  local function _2_()
    return {autoload("nvim-local-fennel.aniseed.core"), autoload("nvim-local-fennel.aniseed.compile"), autoload("nvim-local-fennel.aniseed.nvim")}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_["aniseed/local-fns"] = {autoload = {a = "nvim-local-fennel.aniseed.core", compile = "nvim-local-fennel.aniseed.compile", nvim = "nvim-local-fennel.aniseed.nvim"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _2_(...)
local a = _local_0_[1]
local compile = _local_0_[2]
local nvim = _local_0_[3]
local _2amodule_2a = _0_
local _2amodule_name_2a = "nvim-local-fennel.init"
do local _ = ({nil, _0_, nil, {{}, nil, nil, nil}})[2] end
local cwd
do
  local v_0_
  local function cwd0()
    return nvim.fn.getcwd()
  end
  v_0_ = cwd0
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["cwd"] = v_0_
  cwd = v_0_
end
local parent
do
  local v_0_
  local function parent0(dir)
    local candidate = nvim.fn.fnamemodify(dir, ":h")
    if ((dir ~= candidate) and nvim.fn.isdirectory(candidate)) then
      return candidate
    end
  end
  v_0_ = parent0
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["parent"] = v_0_
  parent = v_0_
end
local parents
do
  local v_0_
  local function parents0(dir)
    local result = {}
    local dir0 = parent(dir)
    while dir0 do
      table.insert(result, 1, dir0)
      dir0 = parent(dir0)
    end
    return result
  end
  v_0_ = parents0
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["parents"] = v_0_
  parents = v_0_
end
local file_readable_3f
do
  local v_0_
  local function file_readable_3f0(path)
    return (1 == nvim.fn.filereadable(path))
  end
  v_0_ = file_readable_3f0
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["file-readable?"] = v_0_
  file_readable_3f = v_0_
end
local file_newer_3f
do
  local v_0_
  local function file_newer_3f0(a0, b)
    return (nvim.fn.getftime(a0) > nvim.fn.getftime(b))
  end
  v_0_ = file_newer_3f0
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["file-newer?"] = v_0_
  file_newer_3f = v_0_
end
local cwd0 = cwd()
local dirs = parents(cwd0)
table.insert(dirs, cwd0)
local function _3_(dir)
  local src = (dir .. "/.lnvim.fnl")
  local dest = (dir .. "/.lnvim.lua")
  if file_readable_3f(src) then
    if file_newer_3f(src, dest) then
      compile.file(src, dest)
    end
    return nvim.ex.luafile(dest)
  else
    if file_readable_3f(dest) then
      return nvim.fn.delete(dest)
    end
  end
end
return a["run!"](_3_, dirs)