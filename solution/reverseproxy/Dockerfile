FROM nginx
COPY config/nginx.conf /etc/nginx/nginx.conf
COPY ssl/* /etc/nginx/certs/
EXPOSE 80
EXPOSE 443
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
CMD ["nginx"]
