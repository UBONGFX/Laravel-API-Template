FROM php:8.3-cli-alpine3.19

WORKDIR /var/www/html

COPY . .

# Copy the binary artifact
COPY --from=spiralscout/roadrunner:2023.3.10 /usr/bin/rr /usr/local/bin/rr

# Environment variable
ENV TZ=Europe/Berlin
ENV SUPERVISOR_PHP_COMMAND="/usr/local/bin/php -d variables_order=EGPCS /var/www/html/artisan octane:start --server=roadrunner --host=0.0.0.0 --rpc-port=6001 --port=80"

# Install required dependencies.
RUN apk update && apk add --no-cache \
    git zip unzip bash php-mbstring php-sockets \
    shadow libpng-dev libjpeg-turbo-dev libwebp-dev \
    freetype-dev libzip-dev supervisor linux-headers tzdata


# Install PHP extensions
RUN docker-php-ext-install \
    pdo_mysql gd zip pcntl sockets

# Configure and install the gd extension
RUN docker-php-ext-configure gd --with-jpeg --with-webp --with-freetype \
    && docker-php-ext-install gd

# Install Composer and install PHP packages optimized for autoloader.
COPY --from=composer:2.2 /usr/bin/composer /usr/local/bin/composer

# Install PHP packages optimized for autoloader
RUN composer install --no-dev --optimize-autoloader    

# Copy configuration files
COPY docker/php.ini "$PHP_INI_DIR/php.ini"
COPY docker/start-container /usr/local/bin/start-container
COPY docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY docker/php.ini /etc/php/8.3/cli/conf.d/99-sail.ini

# Setup permissions and execute permissions
RUN chmod 777 -R /var/www/html/ && \
    chown -R www-data:www-data /var/www/ && \
    chmod +x /usr/local/bin/start-container

# Create user and group
RUN addgroup -g 1000 sail && \
    adduser -D -u 1337 -G sail -s /bin/bash sail

# Expose the port the app runs on
EXPOSE 80

# Define the entry point
ENTRYPOINT ["start-container"]