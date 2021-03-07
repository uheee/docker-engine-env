FROM nvidia/cuda:11.2.1-cudnn8-devel-ubuntu20.04
LABEL maintainer = "Nemo <nemo.tao@refinedchina.com>" \
      description = "A docker image that combines nvidia/cuda, opencv and libtorch"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y wget unzip cmake clang && \
    update-alternatives --set cc /usr/bin/clang && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
COPY downloads.txt ./
RUN wget -i downloads.txt && \
    unzip -f '*.zip'