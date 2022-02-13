#--------------------
# Build
#--------------------
FROM ubuntu:20.04 as builder
RUN apt-get update && apt-get install -y --no-install-recommends \
    scons \
    g++ \
    build-essential \
    wget \
    python \
    python-dev \
    pip

RUN wget http://download-mirror.savannah.gnu.org/releases/gpsd/gpsd-3.19.tar.gz && tar -xzf gpsd-3.19.tar.gz 
RUN cd gpsd-3.19 && scons
