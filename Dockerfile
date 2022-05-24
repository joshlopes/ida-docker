FROM alpine:3.13.0

ENV IGNITE_VERSION=0.17.3
ENV NODE_VERSION=14.19.0-r0
ENV GOPATH=$HOME/go-packages
ENV GOROOT=$HOME/go
ENV PATH='/usr/local/go/bin':$GOROOT/bin:$GOPATH/bin:$PATH

RUN mkdir -p $GOPATH $GOROOT

RUN apk add --no-cache curl make git libc-dev bash gcc linux-headers eudev-dev python3 sudo nodejs=${NODE_VERSION} npm

COPY --from=golang:1.17-alpine /usr/local/go/ /usr/local/go/

RUN wget -qO- https://github.com/ignite-hq/cli/releases/download/v0.21.2/ignite_0.21.2_linux_arm64.tar.gz | tar zxf - \
    && mv ignite /usr/local/bin/ignite \
    && chmod +x /usr/local/bin/ignite

EXPOSE 26656 26657 1317 9090

WORKDIR /home/checkers

ENTRYPOINT [ "bash", "-c" ]
