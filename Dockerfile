FROM ubuntu:latest

RUN apt-get update
RUN apt-get install sudo curl python3 python3-distutils software-properties-common -y
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3 get-pip.py

RUN python3 -m pip install ansible
RUN ansible --version

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
ARG user=enquestor
RUN useradd -m -s /bin/bash -g sudo ${user}
USER ${user}
WORKDIR /home/${user}/ansible
COPY . .

RUN ansible-playbook -i ansible_hosts.yml env.yml

WORKDIR /home/${user}
RUN sudo rm -rf ~/ansible