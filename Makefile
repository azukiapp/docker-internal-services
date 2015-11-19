DOCKER := $(shell which adocker || which docker)
IMAGE_TAG := "azukiapp/internal-services"
all:
	${DOCKER} build -t ${IMAGE_TAG} .

no-cache:
	${DOCKER} build --rm --no-cache -t ${IMAGE_TAG} .

.PHONY: no-cache all
