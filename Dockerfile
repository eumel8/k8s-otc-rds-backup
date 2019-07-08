FROM ubuntu
MAINTAINER Frank Kloeker <f.kloeker@telekom.de>
RUN apt update 
RUN apt install -y python3-pip git
RUN git clone https://github.com/eumel8/ansible-otc.git /ansible-otc
RUN cd /ansibe-otc; pip3 install -r requirements && ./install_roles.sh
ADD k8s.yml /ansible-otc/playbooks/
ADD k8s.sh /ansible-otc/playbooks/
ADD backups.yml.j2 /ansible-otc/playbooks/
ENTRYPOINT ["/ansible-otc/playbooks/k8s.sh"]
