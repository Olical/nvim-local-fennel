.PHONY: compile deps

compile: deps
	rm -rf lua
	nvim -c "set rtp+=deps/aniseed" \
		-c "lua require('aniseed.compile').glob('**/*.fnl', 'fnl', 'lua')" \
		+q
	cp -r deps/aniseed/lua/aniseed lua/nvim-local-fennel/aniseed

deps:
	mkdir -p deps
	if [ ! -d "deps/aniseed" ]; then git clone https://github.com/Olical/aniseed.git deps/aniseed; fi
	cd deps/aniseed && git fetch && git checkout v1.2.0
