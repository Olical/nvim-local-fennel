;; You can give the module any name you want.
(module my-local-fennel
  {require {a nvim-local-fennel.aniseed.core
            str nvim-local-fennel.aniseed.string
            nvim nvim-local-fennel.aniseed.nvim}})

;; A hyphen suffix denotes a private function.
(defn- do-some-things [numbers]
  (a.println
    (nvim.fn.getcwd)
    (a.map a.inc numbers)
    {:Hello :Fennel!}))

;; Public value.
;; You could require this module and access it.
(def counting [1 2 3])

;; Executed as the file is loaded.
(do-some-things counting)
