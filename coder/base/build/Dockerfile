FROM nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04

ENV TZ=Asia/Seoul
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install -y \
	curl \
	git \
	golang \
	sudo \
	vim \
	wget \
	python3.12-full \
	python3.12-dev \
	cmake \
	gh \
	&& rm -rf /var/lib/apt/lists/*

RUN rm /usr/bin/python3
RUN rm /usr/bin/python3.10
RUN ln -sf /usr/bin/python3.12 /usr/bin/python3
RUN ln -sf /usr/bin/python3.12 /usr/bin/python
RUN ln -sf /usr/local/bin/pip3 /usr/bin/pip
RUN python -m ensurepip --upgrade
RUN pip3 install torch torchvision --extra-index-url https://download.pytorch.org/whl/cu124
RUN pip3 install "jax[cuda12]"
RUN pip3 install numpy pandas matplotlib jupyterlab ipykernel tensorboard tqdm

ARG USER=coder
RUN useradd --groups sudo --no-create-home --shell /bin/bash ${USER} \
	&& echo "${USER} ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/${USER} \
	&& chmod 0440 /etc/sudoers.d/${USER}
USER ${USER}
ENV PATH="$PATH:~/.local/bin:/home/${USER}/.local/bin"
WORKDIR /home/${USER}
