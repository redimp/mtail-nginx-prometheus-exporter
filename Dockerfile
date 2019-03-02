FROM debian:jessie

EXPOSE 3093
# install wget
RUN apt-get update -y && apt-get install -y wget
# fetch mtail
RUN wget -q -O /usr/local/bin/mtail https://github.com/google/mtail/releases/download/v3.0.0-rc25/mtail_v3.0.0-rc25_linux_amd64 && chmod +x /usr/local/bin/mtail

COPY progs/ /progs

ENTRYPOINT ["/usr/local/bin/mtail", "-v=2", "-logtostderr", "-port", "3093", "-progs", "/progs", "-logs"]
