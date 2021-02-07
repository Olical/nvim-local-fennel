local _0_0 = nil
do
  local name_0_ = "nvim-local-fennel.aniseed.env"
  local module_0_ = nil
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
local function _1_(...)
  local ok_3f_0_, val_0_ = nil, nil
  local function _1_()
    return {}
  end
  ok_3f_0_, val_0_ = pcall(_1_)
  if ok_3f_0_ then
    _0_0["aniseed/local-fns"] = {}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _1_(...)
local _2amodule_2a = _0_0
local _2amodule_name_2a = "nvim-local-fennel.aniseed.env"
do local _ = ({nil, _0_0, {{}, nil, nil, nil}})[2] end
local config_dir = nil
do
  local v_0_ = vim.api.nvim_call_function("stdpath", {"config"})
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["config-dir"] = v_0_
  config_dir = v_0_
end
local state = nil
do
  local v_0_ = (((_0_0)["aniseed/locals"]).state or {["path-added?"] = false})
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["state"] = v_0_
  state = v_0_
end
local init = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function init0(opts)
      local opts0 = (opts or {})
      if ((false ~= opts0.compile) or os.getenv("ANISEED_ENV_COMPILE")) then
        local compile = require("nvim-local-fennel.aniseed.compile")
        local fennel = require("nvim-local-fennel.aniseed.fennel")
        if not state["path-added?"] then
          fennel["add-path"]((config_dir .. "/?.fnl"))
          state["path-added?"] = true
        end
        compile.glob("**/*.fnl", (config_dir .. (opts0.input or "/fnl")), (config_dir .. (opts0.output or "/lua")), opts0)
      end
      return require((opts0.module or "init"))
    end
    v_0_0 = init0
    _0_0["init"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["init"] = v_0_
  init = v_0_
end
return nil
