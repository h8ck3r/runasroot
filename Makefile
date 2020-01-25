SRC			= runasroot.c
PERM			= 4775
OWNER			= root:root
OPTIMIZATION_LEVEL 	= 5
PREFIX			= $(CURDIR)
BIN			= bin
BINARY			= $(PREFIX)/$(BIN)/runasroot

$(PREFIX):
	@mkdir -p "$@"

$(BIN): | $(PREFIX)
	@mkdir -p "$@"

$(BINARY): | $(BIN)
	@gcc $(SRC) -O$(OPTIMIZATION_LEVEL) -o $(BINARY)

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
	@rm -vrf $(CURDIR)/bin
