From centos:8

RUN yum install -y yum-utils createrepo epel-release
RUN yum install -y yum-plugin-fastestmirror yum-axelget
RUN mkdir -p /repo/conf/
RUN mkdir -p /repo/repo/
RUN mkdir -p /repo/cachedir/
COPY docker-entrypoint.sh /
RUN sed -i 's/enabled=0/enabled=1/g' /etc/yum/pluginconf.d/axelget.conf

ENTRYPOINT ["/docker-entrypoint.sh"]
