FROM library/ubuntu:bionic
MAINTAINER Jakub Bentkowski <bentkowski.jakub@gmail.com>

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    wget \
    xorg-dev \
    libxxf86vm-dev \
    libglu1-mesa-dev \
    clang \
    lldb \
    lld \
    libc++-dev \
    llvm-dev \
    libclang-dev \
    git \
    make \
    cmake \
    libglfw3-dev \
    libglm-dev \
    libspdlog-dev \
    libassimp-dev \
    qt5-default \
    qtdeclarative5-dev \
    qttools5-dev-tools \
    qtdeclarative5-qtquick2-plugin \
    qt5-qmltooling-plugins \
    qml-module-qtquick-controls \
    qml-module-qtquick-layouts \
    python3-pip \
    python3-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN echo -e '#!/bin/bash\npip3 "$@"' > /usr/bin/pip && \
    chmod +x /usr/bin/pip

RUN ls /usr/bin | grep pip
RUN pip install setuptools --upgrade
RUN pip install conan --upgrade
RUN pip install conan_package_tools --upgrade

RUN wget https://cmake.org/files/v3.14/cmake-3.14.3-Linux-x86_64.sh
RUN sudo sh cmake-3.14.3-Linux-x86_64.sh --prefix=/usr/local --exclude-subdir
