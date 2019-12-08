.PHONY: compile deps

compile:
	rm -rf lua
	nvim -c "set rtp+=deps/aniseed" \
		-c "lua require('aniseed.compile').glob('**/*.fnl', 'fnl', 'lua')" \
		+q
	mkdir -p lua/nvim-local-fennel/deps
	cp -r deps/aniseed/lua/aniseed lua/nvim-local-fennel/deps/aniseed

deps:
	mkdir -p deps
	if [ ! -d "deps/aniseed" ]; then git clone https://github.com/Olical/aniseed.git deps/aniseed; fi
	cd deps/aniseed && git fetch && git checkout v1.2.0
