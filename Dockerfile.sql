# Use the official MySQL image
FROM mysql:5.7

# Set environment variables
ENV MYSQL_ROOT_PASSWORD=sawwd493
ENV MYSQL_DATABASE=blog_db
#ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=sawwd493


# Copy MySQL initialization script
COPY init.sql /docker-entrypoint-initdb.d/

# Expose port 3306 to connect to MySQL server
EXPOSE 3306
