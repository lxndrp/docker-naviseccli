# Copyright (c) 2017 Dr. Alexander Papaspyrou.
# See LICENSE file for details.
FROM centos:7
LABEL maintainer Dr. Alexander Papaspyrou <alexander@papaspyrou.name>
ADD ./NaviCLI-Linux-32-x86-en_US-7.30.15.0.44-1.i386.rpm /tmp/navicli.rpm 
RUN yum -y install glibc.i686 libstdc++.i686 /tmp/navicli.rpm
RUN mkdir -p ~/.emc/naviseccli
ENTRYPOINT [ "/opt/Navisphere/bin/naviseccli", "-secfilepath", "~/.emc/naviseccli" ]
