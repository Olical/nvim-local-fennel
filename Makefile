.PHONY: deps compile

deps:
	scripts/dep.sh Olical aniseed origin/develop

compile:
	rm -rf lua
	deps/aniseed/scripts/compile.sh
	deps/aniseed/scripts/embed.sh aniseed nvim-local-fennel
