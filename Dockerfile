FROM node:14 as builder

ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache
RUN git clone https://github.com/erdnando/coltrans-reverse-proxy-ha.git /opt/ha_config

WORKDIR /opt/ha_config


FROM haproxy

COPY --from=builder /opt/ha_config/ /usr/local/etc/haproxy

#COPY haproxy.cfg /usr/local/etc/haproxy

USER root
RUN mkdir -p /run/haproxy/
#docker rmi image erdnando/coltrans-reverse-proxy-ha
#build
#docker build -t erdnando/coltrans-reverse-proxy-ha:1.0 .
#local test
#docker run -itd -p 80:80 --name coltrans-reverse-proxy-ha erdnando/coltrans-reverse-proxy-ha:1.0
#push
#docker push erdnando/coltrans-reverse-proxy-ha:1.0

#https://tsh.io/blog/how-to-scale-websocket/


EXPOSE 80:80