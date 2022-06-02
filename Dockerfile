FROM nginx:alpine

RUN apk add --no-cache --update \
    nginx \
    npm \
    && mkdir -p /usr/share/nginx/html \
    /var/log/nginx/logs \
    /usr/share/nginx/html \
    /usr/share/nginx/html \

COPY --from=node dist/angular-starter /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/nginx.conf

RUN chown -R nginx:nginx /var/run \
    && chown -R nginx:nginx /var/lib \
    && chown -R nginx:nginx /var/log/nginx \
    && chown -R nginx:nginx /etc/nginx/nginx.conf \
    && chown -R nginx:nginx /usr/share/nginx/html

