FROM ubuntu:18.04
LABEL maintainer="jordi@email.cat"

ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update && \
apt-get install -y apache2 libapache2-mod-php && \
apt-get clean

RUN ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stderr /var/log/apache2/error.log

RUN rm /var/www/html/index.html
COPY index.php /var/www/html/

EXPOSE 80
ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]
