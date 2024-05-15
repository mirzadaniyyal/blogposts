# Dockerfile

# Use the official PHP image
FROM php:7.4-apache

# Install required PHP extensions
RUN docker-php-ext-install pdo_mysql

# Set working directory
WORKDIR .

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

# Install PDO MySQL extension
RUN docker-php-ext-install pdo_mysql

# Install MySQLi extension
RUN docker-php-ext-install mysqli

# Enable Apache rewrite module
RUN a2enmod rewrite

# Expose port 80
EXPOSE 80
