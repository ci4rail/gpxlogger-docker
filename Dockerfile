#--------------------
# Build
#--------------------
ARG GPSD_VERSION=3.19
FROM ubuntu:20.04 as builder
ARG GPSD_VERSION

RUN apt-get update && apt-get install -y --no-install-recommends \
    scons \
    g++ \
    build-essential \
    wget \
    python \
    python-dev \
    pip

RUN wget http://download-mirror.savannah.gnu.org/releases/gpsd/gpsd-${GPSD_VERSION}.tar.gz && tar -xzf gpsd-${GPSD_VERSION}.tar.gz 
RUN cd gpsd-${GPSD_VERSION} && scons && pwd
RUN echo "${GPSD_VERSION}"
#--------------------
# Generate Image
#--------------------
FROM ubuntu:20.04
ARG GPSD_VERSION
COPY --from=builder /gpsd-${GPSD_VERSION}/gpxlogger /usr/bin
CMD /usr/bin/gpxlogger
