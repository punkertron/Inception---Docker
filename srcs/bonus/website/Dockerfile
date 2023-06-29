FROM debian:bullseye

EXPOSE 1313

RUN apt-get update && \
	apt-get install -y \
		wget \
		git && \
	wget https://go.dev/dl/go1.20.5.linux-amd64.tar.gz && \
	tar -C /usr/local -xzf go1.20.5.linux-amd64.tar.gz && \
	export PATH=$PATH:/usr/local/go/bin && \
	wget -O hugo.deb https://github.com/gohugoio/hugo/releases/download/v0.114.1/hugo_0.114.1_linux-amd64.deb && \
	apt install ./hugo.deb

WORKDIR /var/html/my_website

#RUN hugo new site . && \
#	git clone https://github.com/lukesmithxyz/lugo themes/lugo && \
#	echo "theme = 'lugo'" >> config.toml && \
#	cp themes/lugo/static/style.css static/ && \
#	hugo


RUN hugo new site . && \
	git clone https://github.com/jpanther/lynx.git themes/lynx && \
	rm -rf assets/ content/ layouts/ config.toml && \
	cp -r ./themes/lynx/exampleSite/* . && \
	hugo

WORKDIR /var/html/my_website

#COPY ./conf/config.toml .

ENTRYPOINT ["hugo", "server", "-p", "1313", "--bind=0.0.0.0"]
