FROM php:7-fpm

RUN apt-get update && \
    docker-php-ext-install -j$(nproc) pdo_mysql && \
    docker-php-ext-install -j$(nproc) mbstring && \
    docker-php-ext-install -j$(nproc) tokenizer

ADD php.ini /usr/local/etc/php/php.ini

EXPOSE 9000

ENTRYPOINT ["php-fpm", "-F"]
