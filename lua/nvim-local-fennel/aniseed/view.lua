local _2afile_2a = "fnl/aniseed/view.fnl"
local _2amodule_name_2a = "nvim-local-fennel.aniseed.view"
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
local function serialise(...)
  return require("nvim-local-fennel.aniseed.deps.fennelview")(...)
end
_2amodule_2a["serialise"] = serialise
