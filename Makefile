all: build

build:
	@gcc runasroot.c -o runasroot
	@sudo chown root:root runasroot
	@sudo chmod 4775 runasroot
