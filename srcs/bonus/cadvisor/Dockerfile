FROM debian:bullseye

EXPOSE 8080

WORKDIR /cad

RUN apt-get update && \
	apt-get install wget -y && \
	apt-get clean && rm -rf /var/lib/apt/lists/* && \
	wget https://github.com/google/cadvisor/releases/download/v0.47.2/cadvisor-v0.47.2-linux-amd64 && \
	mv cadvisor-v0.47.2-linux-amd64 cadvisor && \
	chmod +x cadvisor

ENTRYPOINT ["./cadvisor"]
