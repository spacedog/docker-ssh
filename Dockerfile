FROM        abaranov/base
MAINTAINER  abaranov@linux.com

ENV         UPDATED_AT 2015-03-22

RUN         yum -y -q install \
              openssh-server && \
            yum clean all

RUN         chkconfig sshd off && \
            service sshd stop

CMD         ["/usr/sbin/sshd", "-4" , "-D"]
EXPOSE      22
