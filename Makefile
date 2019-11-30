.PHONY: compile submodules

compile:
	rm -rf lua
	nvim -c "set rtp+=submodules/aniseed" \
		-c "lua require('aniseed.compile').glob('**/*.fnl', 'fnl', 'lua')" \
		+q
	ln -s ../../submodules/aniseed/lua/aniseed lua/nvim-local-fennel/aniseed

submodules:
	git submodule update --init --recursive
