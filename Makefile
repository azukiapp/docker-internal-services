DOCKER := $(shell which adocker || which docker)
all:
	${DOCKER} build -t azukiapp/internal-services:0.1.0 .

no-cache:
	${DOCKER} build --rm --no-cache -t azukiapp/internal-services:0.1.0 .

.PHONY: no-cache all
