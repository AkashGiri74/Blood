-- Creating database
CREATE DATABASE IF NOT EXISTS blood_bank;

-- Creating donor table
CREATE TABLE IF NOT EXISTS donor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    father_name VARCHAR(100) NOT NULL,
    mother_name VARCHAR(100) NOT NULL,
    mobile_number VARCHAR(15) NOT NULL,
    email VARCHAR(100),
    address VARCHAR(255) NOT NULL,
    blood_group VARCHAR(5) NOT NULL
);

-- Creating request_for_blood table
CREATE TABLE IF NOT EXISTS request_for_blood (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    mobile_number VARCHAR(15) NOT NULL,
    city VARCHAR(100) NOT NULL,
    blood_group VARCHAR(5) NOT NULL,
    request_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
