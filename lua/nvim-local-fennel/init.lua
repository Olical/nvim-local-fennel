local _0_0 = nil
do
  local name_0_ = "nvim-local-fennel.init"
  local loaded_0_ = package.loaded[name_0_]
  local module_0_ = nil
  if ("table" == type(loaded_0_)) then
    module_0_ = loaded_0_
  else
    module_0_ = {}
  end
  module_0_["aniseed/module"] = name_0_
  module_0_["aniseed/locals"] = (module_0_["aniseed/locals"] or {})
  module_0_["aniseed/local-fns"] = (module_0_["aniseed/local-fns"] or {})
  package.loaded[name_0_] = module_0_
  _0_0 = module_0_
end
local function _2_(...)
  local ok_3f_0_, val_0_ = nil, nil
  local function _2_()
    return {require("nvim-local-fennel.aniseed.core"), require("nvim-local-fennel.aniseed.compile"), require("nvim-local-fennel.aniseed.nvim")}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_0["aniseed/local-fns"] = {require = {a = "nvim-local-fennel.aniseed.core", compile = "nvim-local-fennel.aniseed.compile", nvim = "nvim-local-fennel.aniseed.nvim"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _1_ = _2_(...)
local a = _1_[1]
local compile = _1_[2]
local nvim = _1_[3]
local _2amodule_2a = _0_0
local _2amodule_name_2a = "nvim-local-fennel.init"
do local _ = ({nil, _0_0, {{}, nil, nil, nil}})[2] end
local cwd = nil
do
  local v_0_ = nil
  local function cwd0()
    return nvim.fn.getcwd()
  end
  v_0_ = cwd0
  _0_0["aniseed/locals"]["cwd"] = v_0_
  cwd = v_0_
end
local parent = nil
do
  local v_0_ = nil
  local function parent0(dir)
    local candidate = nvim.fn.fnamemodify(dir, ":h")
    if ((dir ~= candidate) and nvim.fn.isdirectory(candidate)) then
      return candidate
    end
  end
  v_0_ = parent0
  _0_0["aniseed/locals"]["parent"] = v_0_
  parent = v_0_
end
local parents = nil
do
  local v_0_ = nil
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
  _0_0["aniseed/locals"]["parents"] = v_0_
  parents = v_0_
end
local file_readable_3f = nil
do
  local v_0_ = nil
  local function file_readable_3f0(path)
    return (1 == nvim.fn.filereadable(path))
  end
  v_0_ = file_readable_3f0
  _0_0["aniseed/locals"]["file-readable?"] = v_0_
  file_readable_3f = v_0_
end
local cwd0 = cwd()
local dirs = parents(cwd0)
table.insert(dirs, cwd0)
local function _3_(dir)
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
return a["run!"](_3_, dirs)