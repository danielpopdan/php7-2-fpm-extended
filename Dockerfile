FROM php:7.2-fpm

RUN rm /bin/sh && ln -sf /bin/bash /bin/sh
RUN apt-get update && apt-get install -y curl \
    git \
    zip \
    unzip \
    openssh-client \
    nano \
    librabbitmq-dev \
    libssh-dev \
    zlib1g-dev \
    --no-install-recommends
RUN docker-php-ext-install zip pdo pdo_mysql
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer;
RUN pecl install redis && docker-php-ext-enable redis
RUN pecl install amqp && docker-php-ext-enable amqp
RUN source /root/.bashrc
RUN usermod -u 1000 www-data