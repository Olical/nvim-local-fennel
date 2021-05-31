local _2afile_2a = "fnl/aniseed/env.fnl"
local _0_
do
  local name_0_ = "nvim-local-fennel.aniseed.env"
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
    return {autoload("nvim-local-fennel.aniseed.compile"), autoload("nvim-local-fennel.aniseed.fennel"), autoload("nvim-local-fennel.aniseed.fs"), autoload("nvim-local-fennel.aniseed.nvim")}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_["aniseed/local-fns"] = {autoload = {compile = "nvim-local-fennel.aniseed.compile", fennel = "nvim-local-fennel.aniseed.fennel", fs = "nvim-local-fennel.aniseed.fs", nvim = "nvim-local-fennel.aniseed.nvim"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _2_(...)
local compile = _local_0_[1]
local fennel = _local_0_[2]
local fs = _local_0_[3]
local nvim = _local_0_[4]
local _2amodule_2a = _0_
local _2amodule_name_2a = "nvim-local-fennel.aniseed.env"
do local _ = ({nil, _0_, nil, {{}, nil, nil, nil}})[2] end
local config_dir
do
  local v_0_ = string.gsub(nvim.fn.stdpath("config"), "\\", "/")
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["config-dir"] = v_0_
  config_dir = v_0_
end
local quiet_require
do
  local v_0_
  local function quiet_require0(m)
    local ok_3f, err = nil, nil
    local function _3_()
      return require(m)
    end
    ok_3f, err = pcall(_3_)
    if (not ok_3f and not err:find(("module '" .. m .. "' not found"))) then
      return nvim.ex.echoerr(err)
    end
  end
  v_0_ = quiet_require0
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["quiet-require"] = v_0_
  quiet_require = v_0_
end
local init
do
  local v_0_
  do
    local v_0_0
    local function init0(opts)
      local opts0
      if ("table" == type(opts)) then
        opts0 = opts
      else
        opts0 = {}
      end
      local glob_expr = "**/*.fnl"
      local fnl_dir = (opts0.input or (config_dir .. "/fnl"))
      local lua_dir = (opts0.output or (config_dir .. "/lua"))
      package.path = (package.path .. ";" .. lua_dir .. "/?.lua")
      local function _4_(path)
        if fs["macro-file-path?"](path) then
          return path
        else
          return string.gsub(path, ".fnl$", ".lua")
        end
      end
      if (((false ~= opts0.compile) or os.getenv("ANISEED_ENV_COMPILE")) and fs["glob-dir-newer?"](fnl_dir, lua_dir, glob_expr, _4_)) then
        fennel["add-path"]((fnl_dir .. "/?.fnl"))
        compile.glob(glob_expr, fnl_dir, lua_dir, opts0)
      end
      return quiet_require((opts0.module or "init"))
    end
    v_0_0 = init0
    _0_["init"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["init"] = v_0_
  init = v_0_
end
return nil
