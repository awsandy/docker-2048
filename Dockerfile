FROM alpine:latest

RUN apk --update add nginx

COPY 2048 /usr/share/nginx/html
RUN ln -s /usr/share/nginx/html /usr/share/nginx/html/app1
RUN ln -s /usr/share/nginx/html /usr/share/nginx/html/app2

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
