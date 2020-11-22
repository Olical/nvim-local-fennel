local _0_0 = nil
do
  local name_0_ = "nvim-local-fennel.aniseed.nvim.util"
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
    return {require("nvim-local-fennel.aniseed.nvim")}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_0["aniseed/local-fns"] = {require = {nvim = "nvim-local-fennel.aniseed.nvim"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _1_ = _2_(...)
local nvim = _1_[1]
local _2amodule_2a = _0_0
local _2amodule_name_2a = "nvim-local-fennel.aniseed.nvim.util"
do local _ = ({nil, _0_0, {{}, nil, nil, nil}})[2] end
local normal = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function normal0(keys)
      return nvim.ex.silent(("exe \"normal! " .. keys .. "\""))
    end
    v_0_0 = normal0
    _0_0["normal"] = v_0_0
    v_0_ = v_0_0
  end
  _0_0["aniseed/locals"]["normal"] = v_0_
  normal = v_0_
end
local fn_bridge = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function fn_bridge0(viml_name, mod, lua_name, opts)
      local _3_ = (opts or {})
      local range = _3_["range"]
      local _return = _3_["return"]
      local _4_
      if range then
        _4_ = " range"
      else
        _4_ = ""
      end
      local _6_
      if (_return ~= false) then
        _6_ = "return"
      else
        _6_ = "call"
      end
      local _8_
      if range then
        _8_ = "\" . a:firstline . \", \" . a:lastline . \", "
      else
        _8_ = ""
      end
      return nvim.ex.function_((viml_name .. "(...)" .. _4_ .. "\n          " .. _6_ .. " luaeval(\"require('" .. mod .. "')['" .. lua_name .. "'](" .. _8_ .. "unpack(_A))\", a:000)\n          endfunction"))
    end
    v_0_0 = fn_bridge0
    _0_0["fn-bridge"] = v_0_0
    v_0_ = v_0_0
  end
  _0_0["aniseed/locals"]["fn-bridge"] = v_0_
  fn_bridge = v_0_
end
local with_out_str = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
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
    _0_0["with-out-str"] = v_0_0
    v_0_ = v_0_0
  end
  _0_0["aniseed/locals"]["with-out-str"] = v_0_
  with_out_str = v_0_
end
return nil
