.PHONY: compile submodules

SRC_FILES := $(basename $(shell find fnl -type f -name "*.fnl" -printf '%P\n'))

compile:
	rm -rf lua
	for f in $(SRC_FILES); do \
		mkdir -p lua/$$(dirname $$f); \
		submodules/aniseed/submodules/Fennel/fennel --compile fnl/$$f.fnl > lua/$$f.lua; \
	done
	ln -s ../../submodules/aniseed/lua/aniseed lua/nvim-local-fennel/aniseed

submodules:
	git submodule update --init --recursive
