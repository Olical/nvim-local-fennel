local _2afile_2a = "fnl/aniseed/dotfiles.fnl"
local _0_0
do
  local name_0_ = "nvim-local-fennel.aniseed.dotfiles"
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
  module_0_["aniseed/local-fns"] = ((module_0_)["aniseed/local-fns"] or {})
  package.loaded[name_0_] = module_0_
  _0_0 = module_0_
end
local autoload = (require("nvim-local-fennel.aniseed.autoload")).autoload
local function _1_(...)
  local ok_3f_0_, val_0_ = nil, nil
  local function _1_()
    return {autoload("nvim-local-fennel.aniseed.compile"), autoload("nvim-local-fennel.aniseed.fennel"), autoload("nvim-local-fennel.aniseed.nvim")}
  end
  ok_3f_0_, val_0_ = pcall(_1_)
  if ok_3f_0_ then
    _0_0["aniseed/local-fns"] = {autoload = {compile = "nvim-local-fennel.aniseed.compile", fennel = "nvim-local-fennel.aniseed.fennel", nvim = "nvim-local-fennel.aniseed.nvim"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _1_(...)
local compile = _local_0_[1]
local fennel = _local_0_[2]
local nvim = _local_0_[3]
local _2amodule_2a = _0_0
local _2amodule_name_2a = "nvim-local-fennel.aniseed.dotfiles"
do local _ = ({nil, _0_0, nil, {{}, nil, nil, nil}})[2] end
nvim.out_write("Warning: aniseed.dotfiles is deprecated, see :help aniseed-dotfiles\n")
local config_dir
do
  local v_0_ = nvim.fn.stdpath("config")
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["config-dir"] = v_0_
  config_dir = v_0_
end
fennel["add-path"]((config_dir .. "/?.fnl"))
compile.glob("**/*.fnl", (config_dir .. "/fnl"), (config_dir .. "/lua"))
return require("dotfiles.init")
