prerequisites:
	softwareupdate --install-rosetta --agree-to-license

install: prerequisites
	./setup.sh
	./vim.sh
