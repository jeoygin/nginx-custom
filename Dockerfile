FROM ubuntu:14.04

ADD https://github.com/jeoygin/nginx-custom-deb/releases/download/v0.1/nginx_1.6.2-1.trusty_amd64.deb /tmp/
RUN apt-get update -y
RUN dpkg -i /tmp/nginx_1.6.2-1.trusty_amd64.deb

ADD proxy.conf /etc/nginx/conf.d/

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

ADD run.sh /

CMD /run.sh

