(module nvim-local-fennel.init
  {autoload {compile nvim-local-fennel.aniseed.compile
             nvim nvim-local-fennel.aniseed.nvim
             a nvim-local-fennel.aniseed.core}})

(defn- cwd []
  "Current working directory of Neovim."
  (nvim.fn.getcwd))

(defn- parent [dir]
  "Parent of a directory or nil."
  (let [candidate (nvim.fn.fnamemodify dir ":h")]
    (when (and (not= dir candidate)
               (nvim.fn.isdirectory candidate))
      candidate)))

(defn- parents [dir]
  "All parents of a directory."
  (var result [])
  (var dir (parent dir))
  (while dir
    (table.insert result 1 dir)
    (set dir (parent dir)))
  result)

(defn- file-readable? [path]
  "Is the file readable?"
  (= 1 (nvim.fn.filereadable path)))

(defn- file-newer? [a b]
  (> (nvim.fn.getftime a) (nvim.fn.getftime b)))

;; Iterate over all directories from the root to the cwd.
;; For every .lnvim.fnl, compile it to .lvim.lua (if required) and execute it.
;; If a .lua is found without a .fnl, delete the .lua to clean up.
(let [cwd (cwd)
      dirs (parents cwd)]
  (table.insert dirs cwd)
  (a.run!
    (fn [dir]
      (let [src (.. dir "/.lnvim.fnl")
            dest (.. dir "/.lnvim.lua")]
        (if (file-readable? src)
          (do
            (when (file-newer? src dest)
              (compile.file src dest))
            (nvim.ex.luafile dest))
          (when (file-readable? dest)
            (nvim.fn.delete dest)))))
    dirs))
