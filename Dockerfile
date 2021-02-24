FROM ubuntu:bionic

RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo "root:toor" | chpasswd
RUN sed -ri "s/^#?PermitRootLogin\s+.*/PermitRootLogin yes/" /etc/ssh/sshd_config

EXPOSE 22
CMD [ "/usr/sbin/sshd", "-D" ]
