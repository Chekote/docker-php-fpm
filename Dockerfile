FROM php:7-fpm

RUN apt-get update && \
    apt-get install -y zlib1g-dev && \
    docker-php-ext-install -j$(nproc) pdo_mysql && \
    docker-php-ext-install -j$(nproc) mbstring && \
    docker-php-ext-install -j$(nproc) tokenizer && \
    docker-php-ext-install -j$(nproc) zip && \
    apt-get install -y libmcrypt-dev && \
    docker-php-ext-install -j$(nproc) mcrypt && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    usermod -u 1000 www-data

ADD php.ini /usr/local/etc/php/php.ini

EXPOSE 9000

ENTRYPOINT ["php-fpm", "-F"]
