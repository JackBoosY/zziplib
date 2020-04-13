FROM opensuse/leap:15.1

RUN zypper refresh repo-oss
RUN zypper install -r repo-oss -y gcc zlib-devel python3 cmake unzip zip gzip tar  libSDL2-devel

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