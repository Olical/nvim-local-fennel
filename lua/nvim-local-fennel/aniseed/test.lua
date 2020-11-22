local _0_0 = nil
do
  local name_0_ = "nvim-local-fennel.aniseed.test"
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
    return {require("nvim-local-fennel.aniseed.core"), require("nvim-local-fennel.aniseed.nvim"), require("nvim-local-fennel.aniseed.string")}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_0["aniseed/local-fns"] = {require = {a = "nvim-local-fennel.aniseed.core", nvim = "nvim-local-fennel.aniseed.nvim", str = "nvim-local-fennel.aniseed.string"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _1_ = _2_(...)
local a = _1_[1]
local nvim = _1_[2]
local str = _1_[3]
local _2amodule_2a = _0_0
local _2amodule_name_2a = "nvim-local-fennel.aniseed.test"
do local _ = ({nil, _0_0, {{}, nil, nil, nil}})[2] end
local ok_3f = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function ok_3f0(_3_0)
      local _4_ = _3_0
      local tests = _4_["tests"]
      local tests_passed = _4_["tests-passed"]
      return (tests == tests_passed)
    end
    v_0_0 = ok_3f0
    _0_0["ok?"] = v_0_0
    v_0_ = v_0_0
  end
  _0_0["aniseed/locals"]["ok?"] = v_0_
  ok_3f = v_0_
end
local display_results = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function display_results0(results, prefix)
      do
        local _3_ = results
        local assertions = _3_["assertions"]
        local assertions_passed = _3_["assertions-passed"]
        local tests = _3_["tests"]
        local tests_passed = _3_["tests-passed"]
        local _4_
        if ok_3f(results) then
          _4_ = "OK"
        else
          _4_ = "FAILED"
        end
        a.println((prefix .. " " .. _4_ .. " " .. tests_passed .. "/" .. tests .. " tests and " .. assertions_passed .. "/" .. assertions .. " assertions passed"))
      end
      return results
    end
    v_0_0 = display_results0
    _0_0["display-results"] = v_0_0
    v_0_ = v_0_0
  end
  _0_0["aniseed/locals"]["display-results"] = v_0_
  display_results = v_0_
end
local run = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
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
            local fail = nil
            local function _3_(desc, ...)
              test_failed = true
              local function _4_(...)
                if desc then
                  return (" (" .. desc .. ")")
                else
                  return ""
                end
              end
              return a.println((str.join({prefix, " ", ...}) .. _4_(...)))
            end
            fail = _3_
            local begin = nil
            local function _4_()
              return a.update(results, "assertions", a.inc)
            end
            begin = _4_
            local pass = nil
            local function _5_()
              return a.update(results, "assertions-passed", a.inc)
            end
            pass = _5_
            local t = nil
            local function _6_(e, r, desc)
              begin()
              if (e == r) then
                return pass()
              else
                return fail(desc, "Expected '", a["pr-str"](e), "' but received '", a["pr-str"](r), "'")
              end
            end
            local function _7_(r, desc)
              begin()
              if r then
                return pass()
              else
                return fail(desc, "Expected truthy result but received '", a["pr-str"](r), "'")
              end
            end
            local function _8_(e, r, desc)
              begin()
              local se = a["pr-str"](e)
              local sr = a["pr-str"](r)
              if (se == sr) then
                return pass()
              else
                return fail(desc, "Expected (with pr) '", se, "' but received '", sr, "'")
              end
            end
            t = {["="] = _6_, ["ok?"] = _7_, ["pr="] = _8_}
            local _9_0, _10_0 = nil, nil
            local function _11_()
              return f(t)
            end
            _9_0, _10_0 = pcall(_11_)
            if ((_9_0 == false) and (nil ~= _10_0)) then
              local err = _10_0
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
    _0_0["run"] = v_0_0
    v_0_ = v_0_0
  end
  _0_0["aniseed/locals"]["run"] = v_0_
  run = v_0_
end
local run_all = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function run_all0()
      local function _3_(totals, results)
        for k, v in pairs(results) do
          totals[k] = (v + totals[k])
        end
        return totals
      end
      return display_results(a.reduce(_3_, {["assertions-passed"] = 0, ["tests-passed"] = 0, assertions = 0, tests = 0}, a.filter(a["table?"], a.map(run, a.keys(package.loaded)))), "[total]")
    end
    v_0_0 = run_all0
    _0_0["run-all"] = v_0_0
    v_0_ = v_0_0
  end
  _0_0["aniseed/locals"]["run-all"] = v_0_
  run_all = v_0_
end
local suite = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function suite0()
      nvim.ex.redir_("> test/results.txt")
      local function _3_(path)
        return require(string.gsub(string.match(path, "^test/fnl/(.-).fnl$"), "/", "."))
      end
      a["run!"](_3_, nvim.fn.globpath("test/fnl", "**/*-test.fnl", false, true))
      local results = run_all()
      nvim.ex.redir("END")
      if ok_3f(results) then
        return nvim.ex.q()
      else
        return nvim.ex.cq()
      end
    end
    v_0_0 = suite0
    _0_0["suite"] = v_0_0
    v_0_ = v_0_0
  end
  _0_0["aniseed/locals"]["suite"] = v_0_
  suite = v_0_
end
return nil
