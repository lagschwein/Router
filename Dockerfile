# GCC support can be specified at major, minor, or micro version
# (e.g. 8, 8.2 or 8.2.0).
# See https://hub.docker.com/r/library/gcc/ for all supported GCC
# tags from Docker Hub.
# See https://docs.docker.com/samples/library/gcc/ for more on how to use this image
FROM debian:latest
Label Description="Build environment"

# ENV LD_LIBRARY_PATH=/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH

#install all required rependencies 
RUN apt-get update -y
RUN apt-get install -y\ 
    g++\
    libcrypto++-dev=8.4.0-1\
    libcrypto++-utils=8.4.0-1\
    build-essential\
    libglfw3\
    libglfw3-dev\
    xauth\
    pkg-config\
    python-dev\
    autotools-dev\
    libicu-dev\
    g++\
    libbz2-dev
# USER sudo



# These commands copy your files into the specified directory in the image
# and set that as the working location
# COPY ./libcrypto++.so.8 /lib/x86_64-linux-gnu
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp

# This command compiles your app using GCC, adjust for your source code
# RUN make build
# RUN make
# RUN make prosumer
# This command runs your application, comment out this line to compile only
# CMD ["cd boost_1_66_0 && ./bootstrap.sh --prefix=/usr/local/ && ./b2 install && ./router"]

LABEL Name=router Version=0.0.1
