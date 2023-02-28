ARG REGISTRY_HOST
ARG ENV
FROM ${REGISTRY_HOST}/yhhnamespace/base-ubuntu:${ENV}

ARG VERSION

ENV GOLANG_DOWNLOAD_URL https://mirrors.ustc.edu.cn/golang/go${VERSION}.linux-amd64.tar.gz
RUN wget -q ${GOLANG_DOWNLOAD_URL} -O golang.tar.gz && \
    tar -C /usr/local -xf golang.tar.gz && \
    rm golang.tar.gz

ENV GOPATH /app
ENV GOROOT /usr/local/go
ENV PATH ${GOPATH}/bin:${GOROOT}/bin:$PATH

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin && \
    chmod -R 777 ${GOPATH}

# 执行 go help modules 可获取关于下面介绍的详细描述：
# go1.11 后启用了临时环境变量 GO111MODULE 来控制是否启用 modules 特性，具体如下：
# GO111MODULE = auto，不同版本定义略微不同，如下描述：
# go1.11 或 1.12 版本下，仅当前目录在 $GOPATH 外，并且当前目录存在 go.mod 文件或者当前目录在包含 go.mod 文件的目录下会启用 modules 特性
# go1.13 版本下，不管项目是否在 $GOPATH 目录下，只要当前目录存在 go.mod 文件或者当前目录在包含 go.mod 文件的目录下就会启用 modules 特性
# GO111MODULE = on，不管项目是否在 $GOPATH 下，永远启用 modules 管理依赖
# GO111MODULE = off，不启用 modules 特性
# 默认设置 GO111MODULE 为 auto，各项目根据需要决定是否启用 modules 特性
ENV GO111MODULE auto
ENV GOPROXY https://goproxy.cn,direct

WORKDIR ${GOPATH}

ENV GOFLAGS --buildvcs=false