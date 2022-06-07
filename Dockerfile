FROM nginx:alpine
COPY ./angular/dist/angular-starter /usr/share/nginx/html

RUN chown -R nginx:nginx /var/run \
    && chown -R nginx:nginx /var/lib \
    && chown -R nginx:nginx /var/log/nginx \
    && chown -R nginx:nginx /etc/nginx/nginx.conf \
    && chown -R nginx:nginx /usr/share/nginx/html

COPY nginx.conf /etc/nginx/nginx.conf
