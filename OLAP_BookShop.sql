CREATE DATABASE IF NOT EXISTS OLAP_BookShop;
USE OLAP_BookShop;

CREATE TABLE IF NOT EXISTS region (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS subregion (
    subregion_id INT PRIMARY KEY,
    subregion_name VARCHAR(30),
    region_id INT,
    FOREIGN KEY (region_id) references region(region_id)
);

CREATE TABLE IF NOT EXISTS warehouse (
    code INT PRIMARY KEY,
    subregion_id INT,
    FOREIGN KEY (subregion_id) references subregion(subregion_id)
);

CREATE TABLE IF NOT EXISTS year (
    year_id INT PRIMARY KEY,
    year YEAR(4)
);

CREATE TABLE IF NOT EXISTS month (
    month_id INT PRIMARY KEY,
    month_name VARCHAR(15),
    year_id INT,
    FOREIGN KEY (year_id) references year(year_id)
);

CREATE TABLE IF NOT EXISTS day (
    num_day INT,
    day_id VARCHAR(45) PRIMARY KEY,
    month_id INT,
    FOREIGN KEY (month_id) references month(month_id)
);

CREATE TABLE IF NOT EXISTS books (
    isbn INT PRIMARY KEY,
    title VARCHAR(45),
    price VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS facts_ticket (
    sell_by_product DOUBLE,
    ticket_number INT PRIMARY KEY,
    books_isbn INT,
    warehouse_code INT,
    day_id VARCHAR(45),
    FOREIGN KEY (books_isbn) references books(isbn),
    FOREIGN KEY (warehouse_code) references warehouse(code),
    FOREIGN KEY (day_id) references day(day_id)
);


