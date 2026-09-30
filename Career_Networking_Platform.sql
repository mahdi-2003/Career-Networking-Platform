CREATE DATABASE career_networking;
USE career_networking;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    location VARCHAR(100),
    headline VARCHAR(150),
    bio TEXT,
    education VARCHAR(150),
    industry VARCHAR(100)
);

CREATE TABLE companies (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    industry VARCHAR(100),
    location VARCHAR(100),
    website VARCHAR(200),
    description TEXT
);

CREATE TABLE jobs (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    location VARCHAR(100),
    job_type VARCHAR(50),
    salary DECIMAL(10,2),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

CREATE TABLE applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    job_id INT NOT NULL,
    applied_date DATE NOT NULL,
    status VARCHAR(50) DEFAULT 'Pending',
    resume VARCHAR(255),
    cover_letter TEXT,
    notes TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

CREATE TABLE connections (
    connection_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    connected_user_id INT NOT NULL,
    connection_date DATE NOT NULL,
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (connected_user_id) REFERENCES users(user_id),
    UNIQUE (user_id, connected_user_id)
);