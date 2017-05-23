FROM nginx:1.12-alpine
LABEL maintainer "clement@le-corre.eu"
LABEL description "Nginx web server for popcube docs"

COPY popcube/build/html/ /usr/share/nginx/html 

