# all: check-and-reinit-submodules build-toolchain build-libnaomi
all: check-and-reinit-submodules build-libnaomi

.PHONY: check-and-reinit-submodules
check-and-reinit-submodules:
	@if git submodule status | egrep -q '^[-]|^[+]' ; then \
		echo "INFO: Need to reinitialize git submodules"; \
		git submodule update --init; \
	fi

.PHONY: build-toolchain
build-toolchain: Dockerfile.toolchain
	docker build . -t rattboi/test-toolchain -f Dockerfile.toolchain

.PHONY: build-libnaomi
build-libnaomi: Dockerfile.libnaomi
	docker build . -t rattboi/test-libnaomi -f Dockerfile.libnaomi
