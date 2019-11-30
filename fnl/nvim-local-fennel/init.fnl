(local compile (require :nvim-local-fennel.aniseed.compile))
(local nvim (require :nvim-local-fennel.aniseed.nvim))
(local core (require :nvim-local-fennel.aniseed.core))

(fn cwd []
  "Current working directory of Neovim."
  (nvim.fn.getcwd))

(fn parent [dir]
  "Parent of a directory or nil."
  (let [candidate (nvim.fn.fnamemodify dir ":h")]
    (when (and (not= dir candidate)
               (nvim.fn.isdirectory candidate))
      candidate)))

(fn parents [dir]
  "All parents of a directory."
  (var result [])
  (var dir (parent dir))
  (while dir
    (table.insert result 1 dir)
    (set dir (parent dir)))
  result)

(fn file-readable? [path]
  "Is the file readable?"
  (= 1 (nvim.fn.filereadable path)))

;; Iterate over all directories from the root to the cwd.
;; For every .lnvim.fnl, compile it to .lvim.lua (if required) and execute it.
;; If a .lua is foud without a .fnl, delete the .lua to clean up.
(let [cwd (cwd)
      dirs (parents cwd)]
  (table.insert dirs cwd)
  (core.pr dirs)
  (core.run!
    (fn [dir]
      (let [src (.. dir "/.lnvim.fnl")
            dest (.. dir "/.lnvim.lua")]
        (if (file-readable? src)
          (do
            (compile.file src dest)
            (nvim.ex.luafile dest))
          (when (file-readable? dest)
            (nvim.fn.delete dest)))))
    dirs))

(comment
  ;; Add the project directory to rtp for development.
  (vim.api.nvim_set_option
    :runtimepath
    (.. (vim.api.nvim_get_option :runtimepath)
        ","
        (vim.api.nvim_call_function :getcwd []))))

{:aniseed/module :nvim-local-fennel.init}
