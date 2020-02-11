local _0_0 = nil
do
  local name_23_0_ = "nvim-local-fennel.aniseed.fennel"
  local loaded_23_0_ = package.loaded[name_23_0_]
  local module_23_0_ = nil
  if ("table" == type(loaded_23_0_)) then
    module_23_0_ = loaded_23_0_
  else
    module_23_0_ = require("nvim-local-fennel.aniseed.deps.fennel")
  end
  module_23_0_["aniseed/module"] = name_23_0_
  module_23_0_["aniseed/locals"] = (module_23_0_["aniseed/locals"] or {})
  module_23_0_["aniseed/local-fns"] = (module_23_0_["aniseed/local-fns"] or {})
  package.loaded[name_23_0_] = module_23_0_
  _0_0 = module_23_0_
end
local function _1_(...)
  _0_0["aniseed/local-fns"] = {require = {fennel = "nvim-local-fennel.aniseed.deps.fennel", nvim = "nvim-local-fennel.aniseed.nvim"}}
  return {require("nvim-local-fennel.aniseed.deps.fennel"), require("nvim-local-fennel.aniseed.nvim")}
end
local _2_ = _1_(...)
local fennel = _2_[1]
local nvim = _2_[2]
do local _ = ({nil, _0_0, nil})[2] end
nvim.ex.let("&runtimepath = &runtimepath")
fennel["path"] = string.gsub(string.gsub(string.gsub(package.path, "/lua/", "/fnl/"), ".lua;", ".fnl;"), ".lua$", ".fnl")
return nil
