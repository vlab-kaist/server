FROM nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04

ENV TZ=Asia/Seoul
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get install -y \
	curl \
	git \
	golang \
	sudo \
	vim \
	wget \
	python3.13-full \
	&& rm -rf /var/lib/apt/lists/*

RUN rm /usr/bin/python3
RUN ln -sf /usr/bin/python3.13 /usr/bin/python3
RUN ln -sf /usr/bin/python3.13 /usr/bin/python
RUN python3.13 -m ensurepip --upgrade
RUN pip3 install torch torchvision --extra-index-url https://download.pytorch.org/whl/cu124
RUN pip3 install "jax[cuda12]"
RUN pip3 install numpy pandas matplotlib jupyterlab ipykernel tensorboard tqdm
RUN rm /usr/bin/python3.10
RUN ln -sf /usr/local/bin/pip3 /usr/bin/pip

ARG USER=coder
RUN useradd --groups sudo --no-create-home --shell /bin/bash ${USER} \
	&& echo "${USER} ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/${USER} \
	&& chmod 0440 /etc/sudoers.d/${USER}
USER ${USER}
WORKDIR /home/${USER}