CREATE INDEX zip_code_index on addresses (zip_code);

DROP DATABASE IF EXISTS my_web_db; 
CREATE DATABASE my_web_db CHARSET utf8;
USE my_web_db;

DROP TABLE IF EXISTS downloads;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS users (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    email_address VARCHAR(100) NOT NULL, 
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL ) 
    ENGINE = innoDB;
    
CREATE TABLE IF NOT EXISTS products (
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(45) NOT NULL )
ENGINE = innoDB;

CREATE TABLE IF NOT EXISTS downloads (
download_id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT,
download_date DATETIME,
filename VARCHAR(50),
product_id INT)
ENGINE = innoDB;

/* Script for #3 was not loading/downloadable for me. 
It download 10_3 instead of 11_3 */

ALTER TABLE product 
ADD COLUMN (
product_price DECIMAL (5,2) DEFAULT 9.99,
date_added DATETIME NOT NULL );

ALTER TABLE users
MODIFY first_name VARCHAR(20) NOT NULL;

Update users SET first_name = NULL 
WHERE user_id=1;

UPDATE users 
SET first_name = '111111111111111111111111111'
WHERE user_id = 1; 



