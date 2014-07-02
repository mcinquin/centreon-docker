FROM centos:latest
MAINTAINER Shini <github@capitoul.net>

# setup network
# reference from https://github.com/dotcloud/docker/issues/1240#issuecomment-21807183
RUN echo "NETWORKING=yes" > /etc/sysconfig/network

# CENTOS
RUN yum -y update
RUN yum -y upgrade

# NTP
RUN yum -y install ntp
RUN cp -p /usr/share/zoneinfo/UTC /etc/localtime
RUN ntpdate -s pool.ntp.org
RUN chkconfig ntpdate on
RUN chkconfig ntpd on

# CENTREON
RUN wget http://yum.centreon.com/standard/3.0/stable/RPM-GPG-KEY-CES
RUN rpm --import RPM-GPG-KEY-CES
RUN wget -O /etc/yum.repos.d/ces-standard.repo http://yum.centreon.com/standard/3.0/stable/ces-standard.repo
RUN yum -y update
RUN yum -y install centreon

# ADDTIONNAL TOOLS
RUN yum -y install vim-enhanced screen bash-completion nmap
