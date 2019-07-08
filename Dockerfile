FROM ubuntu:18.04
MAINTAINER Frank Kloeker <f.kloeker@telekom.de>
CMD /bin/bash
RUN apt update 
RUN apt install -y python3-pip git bash
RUN git clone https://github.com/eumel8/ansible-otc.git /ansible-otc
RUN cd /ansible-otc; pip3 install -r requirements.txt && ./install_roles.sh
ADD k8s.yml /ansible-otc/playbooks/
ADD k8s.sh /ansible-otc/playbooks/
ADD backups.yml.j2 /ansible-otc/playbooks/
#ENTRYPOINT ["/ansible-otc/playbooks/k8s.sh"]
