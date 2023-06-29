FROM debian:bullseye

EXPOSE 6379

RUN apt-get update && \
	apt-get install -y redis && \
	apt-get clean && rm -rf /var/lib/apt/lists/* && \
	sed -i "s|bind 127.0.0.1 ::1|bind 0.0.0.0 ::1|g" /etc/redis/redis.conf && \
	sed -i "s|# maxmemory <bytes>|maxmemory 2mb|g" /etc/redis/redis.conf && \
	sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis/redis.conf

ENTRYPOINT ["redis-server", "--protected-mode", "no"]
