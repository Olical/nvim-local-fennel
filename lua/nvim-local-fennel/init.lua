local _0_0 = nil
do
  local name_23_0_ = "nvim-local-fennel.init"
  local loaded_23_0_ = package.loaded[name_23_0_]
  local module_23_0_ = nil
  if ("table" == type(loaded_23_0_)) then
    module_23_0_ = loaded_23_0_
  else
    module_23_0_ = {}
  end
  module_23_0_["aniseed/module"] = name_23_0_
  module_23_0_["aniseed/locals"] = (module_23_0_["aniseed/locals"] or {})
  module_23_0_["aniseed/local-fns"] = (module_23_0_["aniseed/local-fns"] or {})
  package.loaded[name_23_0_] = module_23_0_
  _0_0 = module_23_0_
end
local function _1_(...)
  _0_0["aniseed/local-fns"] = {require = {a = "nvim-local-fennel.aniseed.core", compile = "nvim-local-fennel.aniseed.compile", nvim = "nvim-local-fennel.aniseed.nvim"}}
  return {require("nvim-local-fennel.aniseed.core"), require("nvim-local-fennel.aniseed.compile"), require("nvim-local-fennel.aniseed.nvim")}
end
local _2_ = _1_(...)
local a = _2_[1]
local compile = _2_[2]
local nvim = _2_[3]
do local _ = ({nil, _0_0, nil})[2] end
local cwd = nil
do
  local v_23_0_ = nil
  local function cwd0()
    return nvim.fn.getcwd()
  end
  v_23_0_ = cwd0
  _0_0["aniseed/locals"]["cwd"] = v_23_0_
  cwd = v_23_0_
end
local parent = nil
do
  local v_23_0_ = nil
  local function parent0(dir)
    local candidate = nvim.fn.fnamemodify(dir, ":h")
    if ((dir ~= candidate) and nvim.fn.isdirectory(candidate)) then
      return candidate
    end
  end
  v_23_0_ = parent0
  _0_0["aniseed/locals"]["parent"] = v_23_0_
  parent = v_23_0_
end
local parents = nil
do
  local v_23_0_ = nil
  local function parents0(dir)
    local result = {}
    local dir0 = parent(dir)
    while dir0 do
      table.insert(result, 1, dir0)
      dir0 = parent(dir0)
    end
    return result
  end
  v_23_0_ = parents0
  _0_0["aniseed/locals"]["parents"] = v_23_0_
  parents = v_23_0_
end
local file_readable_3f = nil
do
  local v_23_0_ = nil
  local function file_readable_3f0(path)
    return (1 == nvim.fn.filereadable(path))
  end
  v_23_0_ = file_readable_3f0
  _0_0["aniseed/locals"]["file-readable?"] = v_23_0_
  file_readable_3f = v_23_0_
end
do
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
end