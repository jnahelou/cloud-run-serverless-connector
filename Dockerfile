FROM nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY site.template /etc/nginx/conf.d/site.template
ENTRYPOINT /bin/bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/site.template > /etc/nginx/conf.d/site.conf && exec nginx -g 'daemon off;'"
