# IDA docker proposal

To build the image run `make build`

To print versions run `make versions`

```
LuisIMac-6:ida luislopes$ make build
docker build . -t ida:checker-chain
[+] Building 1.3s (11/11) FINISHED                                                                                                                                                                                                                                          
 => [internal] load build definition from Dockerfile                                                                                                                                                                                                                   0.0s
 => => transferring dockerfile: 37B                                                                                                                                                                                                                                    0.0s
 => [internal] load .dockerignore                                                                                                                                                                                                                                      0.0s
 => => transferring context: 2B                                                                                                                                                                                                                                        0.0s
 => [internal] load metadata for docker.io/library/alpine:3.13.0                                                                                                                                                                                                       0.6s
 => [stage-0 1/6] FROM docker.io/library/alpine:3.13.0@sha256:d9a7354e3845ea8466bb00b22224d9116b183e594527fb5b6c3d30bc01a20378                                                                                                                                         0.0s
 => FROM docker.io/library/golang:1.17-alpine                                                                                                                                                                                                                          0.6s
 => => resolve docker.io/library/golang:1.17-alpine                                                                                                                                                                                                                    0.6s
 => CACHED [stage-0 2/6] RUN mkdir -p /go-packages /go                                                                                                                                                                                                                 0.0s
 => CACHED [stage-0 3/6] RUN apk add --no-cache curl make git libc-dev bash gcc linux-headers eudev-dev python3 sudo nodejs=14.19.0-r0 npm                                                                                                                             0.0s
 => CACHED [stage-0 4/6] COPY --from=golang:1.17-alpine /usr/local/go/ /usr/local/go/                                                                                                                                                                                  0.0s
 => CACHED [stage-0 5/6] RUN wget -qO- https://github.com/ignite-hq/cli/releases/download/v0.21.2/ignite_0.21.2_linux_arm64.tar.gz | tar zxf -     && mv ignite /usr/local/bin/ignite     && chmod +x /usr/local/bin/ignite                                            0.0s
 => CACHED [stage-0 6/6] WORKDIR /home/checkers                                                                                                                                                                                                                        0.0s
 => exporting to image                                                                                                                                                                                                                                                 0.0s
 => => exporting layers                                                                                                                                                                                                                                                0.0s
 => => writing image sha256:5016ca929c6be78df10431a06cc271360dfbb539ebd49f0f967837e4194132ef                                                                                                                                                                           0.0s
 => => naming to docker.io/library/ida:checker-chain                                                                                                                                                                                                                   0.0s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
LuisIMac-6:ida luislopes$ make ignite_version
docker run -it --rm -v "/Users/luislopes/work/ida:/root/ida-checker-chain" -w /root/ida-checker-chain ida:checker-chain "ignite version"
Ignite CLI version:     v0.21.2
Ignite CLI build date:  2022-05-16T18:58:45Z
Ignite CLI source hash: 83cee38e68fe3dd7cdf48a1a7881ac553a281042
Your OS:                linux
Your arch:              arm64
Your go version:        go version go1.17.10 linux/amd64
Your uname -a:          Linux de94a441ca1f 5.10.104-linuxkit #1 SMP Wed Mar 9 19:05:23 UTC 2022 x86_64 Linux
Your cwd:               /root/ida-checker-chain
Is on Gitpod:           false

LuisIMac-6:ida luislopes$ make go_version
docker run -it --rm -v "/Users/luislopes/work/ida:/root/ida-checker-chain" -w /root/ida-checker-chain ida:checker-chain "go version"
go version go1.17.10 linux/amd64
```
