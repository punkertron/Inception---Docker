FROM debian:bullseye

EXPOSE 443

RUN apt-get update && \
	apt-get install nginx openssl -y && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -sha256 -nodes -days 1024 -newkey rsa:4096 \
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/certs/nginx.crt \
	-subj "/C=AM/ST=Yerevan/L=Yerevan/O=school_42/CN=drohanne/emailAddress=drohanne@student.42yerevan.am/"

COPY ./conf/nginx.conf /etc/nginx/conf.d/

ENTRYPOINT ["nginx", "-g", "daemon off;"]
