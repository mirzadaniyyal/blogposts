CREATE DATABASE IF NOT EXISTS blog_db;
USE blog_db;
CREATE TABLE IF NOT EXISTS blog_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    topic_title TEXT,
    topic_date TEXT,
    topic_para TEXT,
    image_filename TEXT
);
