FROM ubuntu:14.04
RUN sudo apt-get update
RUN apt-get -y install nginx && echo "\ndaemon off;" >> /etc/nginx/nginx.conf && rm -rf /var/lib/apt/lists/*
COPY ./config/nginx.conf /etc/nginx/nginx.conf
#COPY ./config/load-balancer.conf /etc/nginx/conf.d/load-balancer.conf
COPY ./config/default /etc/nginx/sites-enabled/default
#RUN rm /etc/nginx/sites-enabled/default
RUN chown -R www-data:www-data /usr/share/nginx/html/*
RUN chmod -R 0755 /usr/share/nginx/html/*
EXPOSE 80 8000
WORKDIR /etc/nginx
CMD ["nginx"]
