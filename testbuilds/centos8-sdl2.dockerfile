FROM centos:8.1.1911

RUN yum install -y yum-utils
RUN yum-config-manager --set-enabled PowerTools
RUN ls -l /etc/yum.repos.d
RUN cat /etc/yum.repos.d/CentOS-PowerTools.repo
RUN yum search sdl
RUN yum install -y gcc zlib-devel python3 cmake make unzip zip gzip tar diffutils  SDL2-devel
RUN mkdir src
COPY CMakeLists.txt README COPYING.LIB ChangeLog src/
COPY bins src/bins
COPY docs src/docs
COPY test src/test
COPY SDL src/SDL
COPY zzipwrap src/zzipwrap
COPY zzip src/zzip

RUN mkdir src/build
RUN cd src/build && cmake ..
RUN cd src/build && make
RUN cd src/build && make check