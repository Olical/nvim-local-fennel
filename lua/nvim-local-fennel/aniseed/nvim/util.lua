local _2afile_2a = "fnl/aniseed/nvim/util.fnl"
local _0_
do
  local name_0_ = "nvim-local-fennel.aniseed.nvim.util"
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
    return {autoload("nvim-local-fennel.aniseed.nvim")}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_["aniseed/local-fns"] = {autoload = {nvim = "nvim-local-fennel.aniseed.nvim"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _2_(...)
local nvim = _local_0_[1]
local _2amodule_2a = _0_
local _2amodule_name_2a = "nvim-local-fennel.aniseed.nvim.util"
do local _ = ({nil, _0_, nil, {{}, nil, nil, nil}})[2] end
local normal
do
  local v_0_
  do
    local v_0_0
    local function normal0(keys)
      return nvim.ex.silent(("exe \"normal! " .. keys .. "\""))
    end
    v_0_0 = normal0
    _0_["normal"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["normal"] = v_0_
  normal = v_0_
end
local fn_bridge
do
  local v_0_
  do
    local v_0_0
    local function fn_bridge0(viml_name, mod, lua_name, opts)
      local _let_0_ = (opts or {})
      local range = _let_0_["range"]
      local _return = _let_0_["return"]
      local _3_
      if range then
        _3_ = " range"
      else
        _3_ = ""
      end
      local _5_
      if (_return ~= false) then
        _5_ = "return"
      else
        _5_ = "call"
      end
      local _7_
      if range then
        _7_ = "\" . a:firstline . \", \" . a:lastline . \", "
      else
        _7_ = ""
      end
      return nvim.ex.function_((viml_name .. "(...)" .. _3_ .. "\n          " .. _5_ .. " luaeval(\"require('" .. mod .. "')['" .. lua_name .. "'](" .. _7_ .. "unpack(_A))\", a:000)\n          endfunction"))
    end
    v_0_0 = fn_bridge0
    _0_["fn-bridge"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["fn-bridge"] = v_0_
  fn_bridge = v_0_
end
local with_out_str
do
  local v_0_
  do
    local v_0_0
    local function with_out_str0(f)
      nvim.ex.redir("=> g:aniseed_nvim_util_out_str")
      do
        local ok_3f, err = pcall(f)
        nvim.ex.redir("END")
        nvim.ex.echon("")
        nvim.ex.redraw()
        if not ok_3f then
          error(err)
        end
      end
      return string.gsub(nvim.g.aniseed_nvim_util_out_str, "^(\n?)(.*)$", "%2%1")
    end
    v_0_0 = with_out_str0
    _0_["with-out-str"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["with-out-str"] = v_0_
  with_out_str = v_0_
end
return nil
