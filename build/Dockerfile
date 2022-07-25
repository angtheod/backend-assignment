FROM php:8.1.5-fpm-alpine

RUN apk --update --virtual build-deps add \
      autoconf \
      make \
      gcc \
      g++ \
      git \
      bash \
      bash-completion \
    && docker-php-ext-install \
      pdo_mysql \
      sockets \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin/ --filename=composer

WORKDIR /var/www/html
COPY . .
