FROM php:latest
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN apt-get update && apt-get install -y git libpng-dev libzip-dev zip unzip
RUN docker-php-ext-install zip && docker-php-ext-enable zip
RUN rm -rf /var/www
RUN mkdir -p /var/www
RUN composer create-project symfony/framework-standard-edition /var/www/
RUN chmod +x /var/www/bin/console
EXPOSE 8080
CMD /var/www/bin/console server:run 0.0.0.0:8080
VOLUME /var/www/
