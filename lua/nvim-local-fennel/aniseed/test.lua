local _2afile_2a = "fnl/aniseed/test.fnl"
local _0_
do
  local name_0_ = "nvim-local-fennel.aniseed.test"
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
  _0_ = module_0_
end
local autoload = (require("nvim-local-fennel.aniseed.autoload")).autoload
local function _1_(...)
  local ok_3f_0_, val_0_ = nil, nil
  local function _1_()
    return {autoload("nvim-local-fennel.aniseed.core"), autoload("nvim-local-fennel.aniseed.nvim"), autoload("nvim-local-fennel.aniseed.string")}
  end
  ok_3f_0_, val_0_ = pcall(_1_)
  if ok_3f_0_ then
    _0_["aniseed/local-fns"] = {autoload = {a = "nvim-local-fennel.aniseed.core", nvim = "nvim-local-fennel.aniseed.nvim", str = "nvim-local-fennel.aniseed.string"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _1_(...)
local a = _local_0_[1]
local nvim = _local_0_[2]
local str = _local_0_[3]
local _2amodule_2a = _0_
local _2amodule_name_2a = "nvim-local-fennel.aniseed.test"
do local _ = ({nil, _0_, nil, {{}, nil, nil, nil}})[2] end
local ok_3f
do
  local v_0_
  do
    local v_0_0
    local function ok_3f0(_2_)
      local _arg_0_ = _2_
      local tests = _arg_0_["tests"]
      local tests_passed = _arg_0_["tests-passed"]
      return (tests == tests_passed)
    end
    v_0_0 = ok_3f0
    _0_["ok?"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["ok?"] = v_0_
  ok_3f = v_0_
end
local display_results
do
  local v_0_
  do
    local v_0_0
    local function display_results0(results, prefix)
      do
        local _let_0_ = results
        local assertions = _let_0_["assertions"]
        local assertions_passed = _let_0_["assertions-passed"]
        local tests = _let_0_["tests"]
        local tests_passed = _let_0_["tests-passed"]
        local _2_
        if ok_3f(results) then
          _2_ = "OK"
        else
          _2_ = "FAILED"
        end
        a.println((prefix .. " " .. _2_ .. " " .. tests_passed .. "/" .. tests .. " tests and " .. assertions_passed .. "/" .. assertions .. " assertions passed"))
      end
      return results
    end
    v_0_0 = display_results0
    _0_["display-results"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["display-results"] = v_0_
  display_results = v_0_
end
local run
do
  local v_0_
  do
    local v_0_0
    local function run0(mod_name)
      local mod = package.loaded[mod_name]
      local tests = (a["table?"](mod) and mod["aniseed/tests"])
      if a["table?"](tests) then
        local results = {["assertions-passed"] = 0, ["tests-passed"] = 0, assertions = 0, tests = #tests}
        for label, f in pairs(tests) do
          local test_failed = false
          a.update(results, "tests", a.inc)
          do
            local prefix = ("[" .. mod_name .. "/" .. label .. "]")
            local fail
            local function _2_(desc, ...)
              test_failed = true
              local function _3_(...)
                if desc then
                  return (" (" .. desc .. ")")
                else
                  return ""
                end
              end
              return a.println((str.join({prefix, " ", ...}) .. _3_(...)))
            end
            fail = _2_
            local begin
            local function _3_()
              return a.update(results, "assertions", a.inc)
            end
            begin = _3_
            local pass
            local function _4_()
              return a.update(results, "assertions-passed", a.inc)
            end
            pass = _4_
            local t
            local function _5_(e, r, desc)
              begin()
              if (e == r) then
                return pass()
              else
                return fail(desc, "Expected '", a["pr-str"](e), "' but received '", a["pr-str"](r), "'")
              end
            end
            local function _6_(r, desc)
              begin()
              if r then
                return pass()
              else
                return fail(desc, "Expected truthy result but received '", a["pr-str"](r), "'")
              end
            end
            local function _7_(e, r, desc)
              begin()
              local se = a["pr-str"](e)
              local sr = a["pr-str"](r)
              if (se == sr) then
                return pass()
              else
                return fail(desc, "Expected (with pr) '", se, "' but received '", sr, "'")
              end
            end
            t = {["="] = _5_, ["ok?"] = _6_, ["pr="] = _7_}
            local _8_, _9_ = nil, nil
            local function _10_()
              return f(t)
            end
            _8_, _9_ = pcall(_10_)
            if ((_8_ == false) and (nil ~= _9_)) then
              local err = _9_
              fail("Exception: ", err)
            end
          end
          if not test_failed then
            a.update(results, "tests-passed", a.inc)
          end
        end
        return display_results(results, ("[" .. mod_name .. "]"))
      end
    end
    v_0_0 = run0
    _0_["run"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["run"] = v_0_
  run = v_0_
end
local run_all
do
  local v_0_
  do
    local v_0_0
    local function run_all0()
      local function _2_(totals, results)
        for k, v in pairs(results) do
          totals[k] = (v + totals[k])
        end
        return totals
      end
      return display_results(a.reduce(_2_, {["assertions-passed"] = 0, ["tests-passed"] = 0, assertions = 0, tests = 0}, a.filter(a["table?"], a.map(run, a.keys(package.loaded)))), "[total]")
    end
    v_0_0 = run_all0
    _0_["run-all"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["run-all"] = v_0_
  run_all = v_0_
end
local suite
do
  local v_0_
  do
    local v_0_0
    local function suite0()
      local function _2_(path)
        return require(string.gsub(string.match(path, "^test/fnl/(.-).fnl$"), "/", "."))
      end
      a["run!"](_2_, nvim.fn.globpath("test/fnl", "**/*-test.fnl", false, true))
      if ok_3f(run_all()) then
        return nvim.ex.q()
      else
        return nvim.ex.cq()
      end
    end
    v_0_0 = suite0
    _0_["suite"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["suite"] = v_0_
  suite = v_0_
end
return nil
