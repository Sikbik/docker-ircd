FROM ubuntu:20.10

MAINTAINER Jason Carver <ut96caarrs@snkmail.com>

RUN apt-get update && \
  apt-get install -y apt-utils # install apt-utils first or apt will complain

RUN apt-get install -y apt-transport-https busybox-syslogd=1:1.30.1-4ubuntu9 ngircd=26-2

# expose IRC ports
EXPOSE :443
EXPOSE :6664
EXPOSE :6667

ADD start.sh /start.sh
ADD ngircd.conf /etc/ngircd/ngircd.conf
ADD ngircd.motd /etc/ngircd/ngircd.motd

ENTRYPOINT ["sh", "/start.sh"]
