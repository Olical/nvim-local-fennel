.PHONY: deps compile

deps:
	mkdir -p deps
	if [ ! -d "deps/aniseed" ]; then git clone https://github.com/Olical/aniseed.git deps/aniseed; fi
	cd deps/aniseed && git fetch && git checkout v2.1.0

compile:
	rm -rf lua
	nvim -u NONE \
		-c "set rtp+=deps/aniseed" \
		-c "lua require('aniseed.compile').glob('**/*.fnl', 'fnl', 'lua')" \
		+q
	cp -r deps/aniseed/lua/aniseed lua/nvim-local-fennel/aniseed
	find lua/nvim-local-fennel/aniseed -type f -name "*.lua" -exec sed -i 's/"aniseed\./"nvim-local-fennel.aniseed./g' {} \;
