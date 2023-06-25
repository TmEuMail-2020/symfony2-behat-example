# Use PHP 5.6 as the base image
FROM gitpod/workspace-full-vnc
USER root
# Install required packages, add PHP repository, and install PHP extensions
RUN apt-get update && \
    add-apt-repository ppa:ondrej/php -y && \
    apt-get install -y --no-install-recommends \
        php5.6-mysql \
        php5.6-curl \
        php5.6-intl && \
    rm -rf /var/lib/apt/lists/*

# Downgrade Composer, set PHP 5.6 as the default version, and perform remaining commands
# must not switch to 5.6 before composer install - composer needs newest php version to be installed
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer && \
    composer self-update --2.2 && \
    update-alternatives --set php /usr/bin/php5.6

USER gitpod
#    && composer install \
#    && php app/console doctrine:schema:create \
#    && echo "yes" | php app/console doctrine:fixtures:load