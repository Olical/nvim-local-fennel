.PHONY: deps compile

deps:
	mkdir -p repos
	if [ ! -d "repos/aniseed" ]; then git clone https://github.com/Olical/aniseed.git repos/aniseed; fi
	cd repos/aniseed && git fetch && git checkout v1.2.0
	rm -r deps
	mkdir -p deps/lua
	cp -r repos/aniseed/lua deps/lua

compile:
	rm -r lua
	nvim -c "set rtp+=repos/aniseed" \
		-c "lua require('aniseed.compile').glob('**/*.fnl', 'fnl', 'lua')" \
		+q
