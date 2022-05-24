DOCKER_IMAGE=ida:checker-chain
DOCKER_COMMAND=docker run -it --rm -v "$(shell pwd):/root/ida-checker-chain" -w /root/ida-checker-chain ${DOCKER_IMAGE}

build:
	docker build . -t ${DOCKER_IMAGE}

versions:
	${DOCKER_COMMAND} "ignite version" "go version"
