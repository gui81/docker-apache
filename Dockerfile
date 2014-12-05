# gui81/apache

FROM centos:centos7
MAINTAINER Lucas Johnson <lucasejohnson@netscape.net>

# install some necessary/desired RPMs and get updates
RUN yum update -y
RUN yum install -y httpd && \
    yum install -y mod_ldap && \
    yum install -y mod_ssl && \
    yum install -y mod_fcgid

RUN yum clean all

VOLUME /etc/httpd/conf
VOLUME /etc/httpd/conf.d
VOLUME /etc/httpd/conf.modules.d
VOLUME /etc/httpd/vhosts.d
VOLUME /var/www
VOLUME /var/log/httpd

EXPOSE 80 443
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]
