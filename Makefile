.PHONY: lint
lint:
	echo "Lint *.lua files"
	find ./configuration/ -name "*.lua" | xargs -I {} stylua --check {}
