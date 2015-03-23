FROM        abaranov/base
MAINTAINER  abaranov@linux.com

ENV         UPDATED_AT 2015-03-22

RUN         yum -y -q install \
              openssh-server && \
            yum clean all

RUN         chkconfig sshd off && \
            service sshd stop

RUN         ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN         ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key


CMD         ["/usr/sbin/sshd", "-4" , "-D"]
EXPOSE      22
