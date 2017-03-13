FROM nginx

COPY etc/nginx.conf /etc/nginx/conf.d/default.conf

RUN apt-get update
RUN apt-get install -y mc
RUN mkdir -p /var/db/nginx
