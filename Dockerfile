FROM php:7-fpm

RUN apt-get update && \
    docker-php-ext-install -j$(nproc) pdo_mysql && \
    docker-php-ext-install -j$(nproc) mbstring && \
    docker-php-ext-install -j$(nproc) tokenizer && \
    apt-get install -y libmcrypt-dev && \
    docker-php-ext-install -j$(nproc) mcrypt && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD php.ini /usr/local/etc/php/php.ini

EXPOSE 9000

ENTRYPOINT ["php-fpm", "-F"]
