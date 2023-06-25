# Use PHP 5.6 as the base image
FROM php:5.6

# Install required packages, add PHP repository, and install PHP extensions
RUN apt-get update \
    && add-apt-repository ppa:ondrej/php -y \
    && apt-get install -y --no-install-recommends \
        php5.6-mysql \
        php5.6-curl \
        php5.6-intl \
    && rm -rf /var/lib/apt/lists/*

# Downgrade Composer, set PHP 5.6 as the default version, and perform remaining commands
#RUN curl -sS https://getcomposer.org/installer | php -- --version=2.2 --install-dir=/usr/local/bin --filename=composer \
#    && update-alternatives --set php /usr/bin/php5.6 \
#    && composer install \
#    && php app/console doctrine:schema:create \
#    && echo "yes" | php app/console doctrine:fixtures:load