FROM ubuntu:22.04

RUN apt update -y
RUN apt install -y sudo vim

ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USER_NAME=defaultuser
ARG GROUP_NAME=$(USER_NAME)

RUN groupadd --gid ${GROUP_ID} ${GROUP_NAME}
RUN useradd -s /bin/bash -m --gid ${GROUP_ID} --uid=${USER_ID} ${USER_NAME}
RUN usermod -aG sudo ${USER_NAME}
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' | EDITOR='tee -a' visudo

USER ${USER_NAME}
