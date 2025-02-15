FROM alpine:latest

# RUN apk --update add jq curl grep sed openrc nginx --no-cache
RUN apk --update add openrc nginx --no-cache

RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /run/nginx

RUN mkdir -p /opt/www
RUN ln -s /opt/www /opt/www/app1
RUN ln -s /opt/www /opt/www/app2
RUN ln -s /opt/www /opt/www/app3

WORKDIR /opt/www
ADD start.sh .
RUN chmod +x start.sh
COPY 2048 /opt/www
RUN ls -l /opt/www



EXPOSE 80

ENTRYPOINT ["/bin/sh"]
CMD ["/opt/www/start.sh"]