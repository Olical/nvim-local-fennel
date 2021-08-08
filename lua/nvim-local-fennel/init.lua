local _2afile_2a = "fnl/nvim-local-fennel/init.fnl"
local _1_
do
  local name_4_auto = "nvim-local-fennel.init"
  local module_5_auto
  do
    local x_6_auto = _G.package.loaded[name_4_auto]
    if ("table" == type(x_6_auto)) then
      module_5_auto = x_6_auto
    else
      module_5_auto = {}
    end
  end
  module_5_auto["aniseed/module"] = name_4_auto
  module_5_auto["aniseed/locals"] = ((module_5_auto)["aniseed/locals"] or {})
  do end (module_5_auto)["aniseed/local-fns"] = ((module_5_auto)["aniseed/local-fns"] or {})
  do end (_G.package.loaded)[name_4_auto] = module_5_auto
  _1_ = module_5_auto
end
local autoload
local function _3_(...)
  return (require("nvim-local-fennel.aniseed.autoload")).autoload(...)
end
autoload = _3_
local function _6_(...)
  local ok_3f_21_auto, val_22_auto = nil, nil
  local function _5_()
    return {autoload("nvim-local-fennel.aniseed.core"), autoload("nvim-local-fennel.aniseed.compile"), autoload("nvim-local-fennel.aniseed.nvim")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {autoload = {a = "nvim-local-fennel.aniseed.core", compile = "nvim-local-fennel.aniseed.compile", nvim = "nvim-local-fennel.aniseed.nvim"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local a = _local_4_[1]
local compile = _local_4_[2]
local nvim = _local_4_[3]
local _2amodule_2a = _1_
local _2amodule_name_2a = "nvim-local-fennel.init"
do local _ = ({nil, _1_, nil, {{}, nil, nil, nil}})[2] end
local cwd
do
  local v_23_auto
  local function cwd0()
    return nvim.fn.getcwd()
  end
  v_23_auto = cwd0
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["cwd"] = v_23_auto
  cwd = v_23_auto
end
local parent
do
  local v_23_auto
  local function parent0(dir)
    local candidate = nvim.fn.fnamemodify(dir, ":h")
    if ((dir ~= candidate) and nvim.fn.isdirectory(candidate)) then
      return candidate
    end
  end
  v_23_auto = parent0
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["parent"] = v_23_auto
  parent = v_23_auto
end
local parents
do
  local v_23_auto
  local function parents0(dir)
    local result = {}
    local dir0 = parent(dir)
    while dir0 do
      table.insert(result, 1, dir0)
      dir0 = parent(dir0)
    end
    return result
  end
  v_23_auto = parents0
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["parents"] = v_23_auto
  parents = v_23_auto
end
local file_readable_3f
do
  local v_23_auto
  local function file_readable_3f0(path)
    return (1 == nvim.fn.filereadable(path))
  end
  v_23_auto = file_readable_3f0
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["file-readable?"] = v_23_auto
  file_readable_3f = v_23_auto
end
local file_newer_3f
do
  local v_23_auto
  local function file_newer_3f0(a0, b)
    return (nvim.fn.getftime(a0) > nvim.fn.getftime(b))
  end
  v_23_auto = file_newer_3f0
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["file-newer?"] = v_23_auto
  file_newer_3f = v_23_auto
end
local cwd0 = cwd()
local dirs = parents(cwd0)
table.insert(dirs, cwd0)
local function _9_(dir)
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
return a["run!"](_9_, dirs)