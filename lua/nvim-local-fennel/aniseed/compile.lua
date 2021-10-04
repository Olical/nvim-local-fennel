local _2afile_2a = "fnl/aniseed/compile.fnl"
local _2amodule_name_2a = "nvim-local-fennel.aniseed.compile"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("nvim-local-fennel.aniseed.autoload")).autoload
local a, fennel, fs, nvim = autoload("nvim-local-fennel.aniseed.core"), autoload("nvim-local-fennel.aniseed.fennel"), autoload("nvim-local-fennel.aniseed.fs"), autoload("nvim-local-fennel.aniseed.nvim")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["fennel"] = fennel
_2amodule_locals_2a["fs"] = fs
_2amodule_locals_2a["nvim"] = nvim
local function macros_prefix(code, opts)
  local macros_module = "nvim-local-fennel.aniseed.macros"
  local filename
  do
    local _1_ = a.get(opts, "filename")
    if _1_ then
      filename = string.gsub(_1_, (nvim.fn.getcwd() .. fs["path-sep"]), "")
    else
      filename = _1_
    end
  end
  local _3_
  if filename then
    _3_ = ("\"" .. string.gsub(filename, "\\", "\\\\") .. "\"")
  else
    _3_ = "nil"
  end
  return ("(local *file* " .. _3_ .. ")" .. "(require-macros \"" .. macros_module .. "\")\n" .. (code or ""))
end
_2amodule_2a["macros-prefix"] = macros_prefix
local marker_prefix = "ANISEED_"
_2amodule_2a["marker-prefix"] = marker_prefix
local delete_marker = (marker_prefix .. "DELETE_ME")
do end (_2amodule_2a)["delete-marker"] = delete_marker
local delete_marker_pat = ("\n[^\n]-\"" .. delete_marker .. "\".-")
do end (_2amodule_locals_2a)["delete-marker-pat"] = delete_marker_pat
local function str(code, opts)
  ANISEED_STATIC_MODULES = (true == a.get(opts, "static?"))
  local fnl = fennel.impl()
  local function _5_()
    return string.gsub(string.gsub(fnl.compileString(macros_prefix(code, opts), a["merge!"]({allowedGlobals = false, compilerEnv = _G}, opts)), (delete_marker_pat .. "\n"), "\n"), (delete_marker_pat .. "$"), "")
  end
  return xpcall(_5_, fnl.traceback)
end
_2amodule_2a["str"] = str
local function file(src, dest, opts)
  local code = a.slurp(src)
  local _6_, _7_ = str(code, a["merge!"]({filename = src}, opts))
  if ((_6_ == false) and (nil ~= _7_)) then
    local err = _7_
    return nvim.err_writeln(err)
  elseif ((_6_ == true) and (nil ~= _7_)) then
    local result = _7_
    fs.mkdirp(fs.basename(dest))
    return a.spit(dest, result)
  else
    return nil
  end
end
_2amodule_2a["file"] = file
local function glob(src_expr, src_dir, dest_dir, opts)
  for _, path in ipairs(fs.relglob(src_dir, src_expr)) do
    if fs["macro-file-path?"](path) then
      a.spit((dest_dir .. path), a.slurp((src_dir .. path)))
    else
      file((src_dir .. path), string.gsub((dest_dir .. path), ".fnl$", ".lua"), opts)
    end
  end
  return nil
end
_2amodule_2a["glob"] = glob
