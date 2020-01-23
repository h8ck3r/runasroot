BINARY	= runasroot
SRC	= runasroot.c
PERM	= 4775
OWNER	= root:root

$(BINARY):
	@gcc $(SRC) -o $(BINARY)

.PHONY: all
all: build

.PHONY: build
build: $(BINARY)

.PHONY: own
own: $(BINARY)
	@sudo chown $(OWNER) $(BINARY)

.PHONY: setuid
setuid: own
	@sudo chmod $(PERM) $(BINARY)

.PHONY: clean
clean:
	@rm -vf $(BINARY)
