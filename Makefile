prerequisites:
	echo "${USER} ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/${USER}
	sudo apt install -y git curl wget

install: prerequisites
	./setup.sh
	run-parts --regex ".*\.sh$$" ./install
