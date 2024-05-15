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

# Use the official MySQL image
FROM mysql:5.7

# Set environment variables
ENV MYSQL_ROOT_PASSWORD=sawwd493
ENV MYSQL_DATABASE=blog_db
ENV MYSQL_PASSWORD=sawwd493

# Copy MySQL initialization script
COPY init.sql /docker-entrypoint-initdb.d/

# Expose port 3306 to connect to MySQL server
EXPOSE 3306
