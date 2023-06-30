FROM debian:bullseye

EXPOSE 1313

RUN apt-get update && \
	apt-get install -y \
		wget \
		git && \
	wget -O hugo.deb https://github.com/gohugoio/hugo/releases/download/v0.110.0/hugo_0.110.0_linux-amd64.deb && \
        dpkg -i ./hugo.deb

WORKDIR /var/html/my_website

RUN hugo new site . && \
	git clone https://github.com/jpanther/lynx.git themes/lynx && \
	rm -rf assets/ content/ layouts/ config.toml && \
	cp -r ./themes/lynx/exampleSite/* . && \
	sed -i "s|View the readme or check out all the link styles available using the links below.|Click on the icons below|g" ./content/_index.md

COPY ./conf/config.toml .
COPY ./assets/ ./assets/

ENTRYPOINT ["hugo", "server", "--bind=0.0.0.0", "--port=1313"]
