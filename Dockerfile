FROM chialab/php:7.4-fpm

ADD docker/php.ini /usr/local/etc/php/php.ini

WORKDIR /var/www

COPY ./*.php /var/www/
COPY ./*.json /var/www/
COPY ./*.lock /var/www/

RUN composer install && composer upgrade

CMD ["php-fpm"]

RUN chown -R www-data:www-data /var/www