use db;
drop table dummy_table;
CREATE TABLE Publisher(
	PublisherId INT AUTO_INCREMENT PRIMARY KEY,
    PublisherName VARCHAR(256),
    PublisherAddress VARCHAR(256),
    PublisherPhone INT,
    URL VARCHAR(256)
);

CREATE TABLE Author(
	AuthorId INT AUTO_INCREMENT PRIMARY KEY,
    AuthorName VARCHAR(256),
    AuthorAddress VARCHAR(256)
);

CREATE TABLE Book(
	Isbn VARCHAR(256) PRIMARY KEY,
    Year INT,
    Title VARCHAR(256),
    Price FLOAT,
    PublisherId INT,
    AuthorId INT,
    FOREIGN KEY (PublisherId) REFERENCES Publisher(PublisherId),
    FOREIGN KEY (AuthorId) REFERENCES Author(AuthorId)
);

CREATE TABLE Customer(
	CustomerEmail VARCHAR(256) PRIMARY KEY,
    CustomerName VARCHAR(256),
    CustomerPhone VARCHAR(256),
    CustomerAddress VARCHAR(256)
);

CREATE TABLE ShoppingBasket(
	ShoppingBasketId INT AUTO_INCREMENT PRIMARY KEY,
    CustomerEmail VARCHAR(256),
    FOREIGN KEY (CustomerEmail) REFERENCES Customer(CustomerEmail)
);

CREATE TABLE Warehouse(
	Code INT AUTO_INCREMENT PRIMARY KEY,
    WarehousePhone varchar(256),
    WarehouseAddress varchar(256)
);

CREATE TABLE ShoppingBaskets_have_Books(
	ShoppingBasketid INT,
    Book_ISBN VARCHAR(256),
    Count INT,
    PRIMARY KEY(ShoppingBasketid,Book_ISBN),
    FOREIGN KEY (ShoppingBasketid) REFERENCES ShoppingBasket(ShoppingBasketid),
    FOREIGN KEY (Book_ISBN) REFERENCES Book(Isbn)
);

CREATE TABLE Warehouses_have_books(
	Warehousecode INT,
    Book_ISBN VARCHAR(256),
    Count INT,
    FOREIGN KEY (Warehousecode) REFERENCES Warehouse(Code),
    FOREIGN KEY (Book_ISBN) REFERENCES Book(Isbn),
    PRIMARY KEY(Warehousecode,Book_ISBN)
);

drop table ShoppingBaskets_have_Books;

