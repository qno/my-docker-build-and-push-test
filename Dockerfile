FROM ubuntu
RUN  apt-get update && apt-get install -y --no-install-recommends git build-essential automake curl wget
RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["make", "rack-sdk-all"]
