FROM wordpress:6.2.0-fpm-alpine

RUN apk update && apk add libxml2-dev
RUN docker-php-ext-install pdo pdo_mysql soap