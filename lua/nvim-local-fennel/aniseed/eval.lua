local _2afile_2a = "fnl/aniseed/eval.fnl"
local _1_
do
  local name_4_auto = "nvim-local-fennel.aniseed.eval"
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
    return {autoload("nvim-local-fennel.aniseed.core"), autoload("nvim-local-fennel.aniseed.compile"), autoload("nvim-local-fennel.aniseed.fennel"), autoload("nvim-local-fennel.aniseed.fs"), autoload("nvim-local-fennel.aniseed.nvim")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {autoload = {a = "nvim-local-fennel.aniseed.core", compile = "nvim-local-fennel.aniseed.compile", fennel = "nvim-local-fennel.aniseed.fennel", fs = "nvim-local-fennel.aniseed.fs", nvim = "nvim-local-fennel.aniseed.nvim"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local a = _local_4_[1]
local compile = _local_4_[2]
local fennel = _local_4_[3]
local fs = _local_4_[4]
local nvim = _local_4_[5]
local _2amodule_2a = _1_
local _2amodule_name_2a = "nvim-local-fennel.aniseed.eval"
do local _ = ({nil, _1_, nil, {{}, nil, nil, nil}})[2] end
local str
do
  local v_23_auto
  do
    local v_25_auto
    local function str0(code, opts)
      local fnl = fennel.impl()
      local function _8_()
        return fnl.eval(compile["macros-prefix"](code, opts), a.merge({["compiler-env"] = _G}, opts))
      end
      return xpcall(_8_, fnl.traceback)
    end
    v_25_auto = str0
    _1_["str"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["str"] = v_23_auto
  str = v_23_auto
end
return nil
