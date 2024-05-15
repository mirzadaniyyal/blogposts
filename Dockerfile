# Dockerfile

# Use the official PHP image
FROM php:7.4

# Install required PHP extensions
RUN docker-php-ext-install pdo_mysql

# Set working directory
WORKDIR /var/www/html/blog

# Copy PHP application files to container
COPY . .

# Install any other required dependencies
RUN apt-get update && apt-get install -y \
    # Install any other dependencies you need for testing
    && rm -rf /var/lib/apt/lists/*

# Install PHPUnit
RUN curl -sS https://phar.phpunit.de/phpunit.phar -o phpunit \
    && chmod +x phpunit \
    && mv phpunit /usr/local/bin/phpunit

# Run tests
CMD ["phpunit", "tests/"]
