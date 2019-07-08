FROM ubuntu:18.04
#FROM phusion/baseimage
MAINTAINER Frank Kloeker <f.kloeker@telekom.de>
ARG CACHEBUST=1
RUN apt update 
RUN apt install -y python3-pip git bash
RUN git clone https://github.com/eumel8/ansible-otc.git /ansible-otc
RUN cd /ansible-otc; pip3 install -r requirements.txt && ./install_roles.sh
RUN cat /etc/os-release
ADD k8s.yml /ansible-otc/playbooks/
ADD k8s.sh /ansible-otc/playbooks/
ADD inventory /ansible-otc/playbooks/
CMD cd /ansible-otc/playbooks; ./k8s.sh
