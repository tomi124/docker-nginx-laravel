# step 1
FROM php:7.3-fpm
# step 2
WORKDIR /root
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y procps
RUN apt-get install -y vim

# step 3
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer
# step 4
RUN apt-get install -y zlib1g-dev && apt-get install -y libzip-dev
RUN docker-php-ext-install zip
# step 5
RUN composer global require laravel/installer
RUN ["/bin/bash", "-c", "echo PATH=$PATH:~/.composer/vendor/bin/ >> ~/.bashrc"]
RUN ["/bin/bash", "-c", "source ~/.bashrc"]
# step 6
EXPOSE 8000
CMD php /source/study/artisan serve --host=0.0.0.0 --port=8000
