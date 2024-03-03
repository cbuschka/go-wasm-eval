PROJECT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

build:	init
	cd $(PROJECT_DIR) && \
	mkdir -p ./dist/assets/ && \
	GOOS=js GOARCH=wasm go build -o ./dist/assets/json.wasm cmd/wasm.go && \
	cp -r ./public/* ./dist/

clean:
	cd $(PROJECT_DIR) && \
	rm -rf dist/*

init:
	cd $(PROJECT_DIR) && \
	mkdir -p dist/

serve:	init
	cd $(PROJECT_DIR)/dist/ && \
	python -m http.server 9000
