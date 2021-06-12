FROM ubuntu:20.04
MAINTAINER sudhams reddy duba<dubareddy.383@gmail.com>
ENV DEBAIN_FRONTEND=noninteractive
ENV TZ=Asia/Calcutta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && \
    apt-get install -y iproute2 nginx curl memcached \
    php-fpm php-memcached php-cli
COPY src/index.html /usr/share/nginx/html/
COPY src/* /var/www/html/
COPY default /etc/nginx/sites-available/
COPY startup_script/* /root/
RUN chmod +x /root/
VOLUME /usr/share/nginx/html
EXPOSE 80
CMD ./root/start_services.sh
HEALTHCHECK CMD curl --fail http://localhost:80/ || exit 1
