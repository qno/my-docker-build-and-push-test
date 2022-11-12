FROM ubuntu

RUN groupadd -g 1000 build
RUN useradd --create-home --uid 1000 --gid 1000 --shell /bin/bash build
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends make

USER build
RUN mkdir -p /home/build/rack-plugin-toolchain
WORKDIR /home/build/rack-plugin-toolchain

COPY Makefile /home/build/rack-plugin-toolchain/

USER root
RUN make dep-ubuntu
# Clean up files to free up space
RUN rm -rf /var/lib/apt/lists/*

USER build

ADD entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
