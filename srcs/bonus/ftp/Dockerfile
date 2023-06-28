FROM debian:bullseye

EXPOSE 21

RUN apt-get update && \
	apt-get install vsftpd -y && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/initial.sh .

ENTRYPOINT ["bash", "initial.sh"]
