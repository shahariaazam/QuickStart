FROM php:8.1-fpm-alpine

RUN apk add --no-cache bash \
    && php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

COPY . /var/www/html
WORKDIR /var/www/html

RUN composer install \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --prefer-dist

CMD [ "php", "./src/index.php" ]
