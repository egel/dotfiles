.PHONY: lint
lint:
	echo "Lint *.lua files"
	stylua --config-path=./.stylua.toml --check --verify --output-format=Json .
