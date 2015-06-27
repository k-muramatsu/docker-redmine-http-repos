FROM centos:centos6
MAINTAINER k.muramatsu625@gmail.com

ENV PATH $PATH:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

ADD assets/config/wandisco.repo /etc/yum.repos.d/
RUN rpm --import http://opensource.wandisco.com/RPM-GPG-KEY-WANdisco

RUN		yum update -y

RUN		yum install -y epel-release \
	&&	yum install -y --enablerepo=epel supervisor

RUN		yum install sudo httpd mod_perl mod_dav_svn perl-DBI perl-Digest-SHA perl-DBD-MySQL logrotate crontabs git -y \
	&&	yum install --enablerepo=wandisco-svn subversion -y

ENV LANG C.UTF-8
ENV LC_MESSAGES POSIX

ADD assets/config/redmine_scm.conf /etc/httpd/conf.d/
ADD assets/config/perl.conf /etc/httpd/conf.d/
ADD assets/config/subversion.conf /etc/httpd/conf.d/
RUN mkdir -p /usr/lib64/perl5/Apache/Authn
ADD assets/config/Redmine.pm /usr/lib64/perl5/Apache/Authn/

ADD assets/setup/ /app/setup/
RUN chmod 755 /app/setup/install
RUN /app/setup/install

ADD assets/init /app/init
RUN chmod 755 /app/init

RUN mkdir -p /var/repos/{git,svn}

EXPOSE 80
EXPOSE 443

VOLUME ["/var/log"]
VOLUME ["/var/repos/svn"]
VOLUME ["/var/repos/git"]

WORKDIR /etc/httpd

CMD ["/app/init"]

