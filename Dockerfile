FROM ubuntu:bionic

# Install openssh
RUN apt-get update
RUN apt-get install -y openssh-server

RUN mkdir /var/run/sshd
RUN echo "root:toor" | chpasswd

# Copy configurations
COPY sshd_config /etc/ssh/
COPY motd /etc/
COPY .bashrc /root/

# Run ssh daemon
CMD "/usr/sbin/sshd" -D
