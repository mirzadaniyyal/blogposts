# Use the official PHP image
FROM php:7.4-apache

# Set working directory
WORKDIR .

# Copy your PHP application files to the container
COPY . .

# Install PDO MySQL extension
RUN docker-php-ext-install pdo_mysql

# Install MySQLi extension
RUN docker-php-ext-install mysqli

# Enable Apache rewrite module
RUN a2enmod rewrite

# Expose port 80
EXPOSE 80


