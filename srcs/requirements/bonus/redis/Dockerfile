FROM debian:buster

RUN apt-get update -y
RUN apt-get install redis -y

COPY ./conf/redis.conf ./etc/redis/redis.conf

EXPOSE 6379

CMD ["redis-server", "--protected-mode", "no"]