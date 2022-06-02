# stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/angular-starter /usr/share/nginx/html

RUN chown -R nginx:nginx /var/run \
    && chown -R nginx:nginx /var/lib \
    && chown -R nginx:nginx /var/log/nginx \
    && chown -R nginx:nginx /etc/nginx/nginx.conf \
    && chown -R nginx:nginx /usr/share/nginx/html

COPY nginx.conf /etc/nginx/nginx.conf
