CREATE DATABASE BookShop;
USE BookShop; /* the following objects will be created in sailorsdb */


-- -----------------------------------------------------
-- Table `BookShop`.`Publisher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BookShop`.`Publisher` (
`Publisherid` INT NOT NULL,
`Publishername` VARCHAR(45) NOT NULL,
`PublisherPhone` INT NULL,
`URL` VARCHAR(45) NULL,
`PublisherAddress` VARCHAR(45) NULL,
PRIMARY KEY (`Publisherid`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `BookShop`.`Author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BookShop`.`Author` (
`Authorid` INT NOT NULL,
`AuthorName` VARCHAR(45) NOT NULL,
`AuthorAddress` VARCHAR(45) NULL,
PRIMARY KEY (`Authorid`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `BookShop`.`Book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BookShop`.`Book` (
`ISBN` VARCHAR(20) NOT NULL,
`Year` YEAR(4) NULL,
`Title` VARCHAR(45) NOT NULL,
`Price` FLOAT NULL,
`Publisherid` INT NOT NULL,
`Authorid` INT NOT NULL,
PRIMARY KEY (`ISBN`, `Publisherid`, `Authorid`),
INDEX `fk_Book_Publisher_idx` (`Publisherid` ASC),
INDEX `fk_Book_Author1_idx` (`Authorid` ASC),
CONSTRAINT `fk_Book_Publisher`
FOREIGN KEY (`Publisherid`)
REFERENCES `BookShop`.`Publisher` (`Publisherid`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_Book_Author1`
FOREIGN KEY (`Authorid`)
REFERENCES `BookShop`.`Author` (`Authorid`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `BookShop`.`Warehouse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BookShop`.`Warehouse` (
`code` INT NOT NULL,
`WarehousePhone` VARCHAR(45) NULL,
`WarehouseAddress` VARCHAR(45) NULL,
PRIMARY KEY (`code`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `BookShop`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BookShop`.`Customer` (
`CustomerEmail` VARCHAR(45) NOT NULL,
`CustomerName` VARCHAR(45) NOT NULL,
`CustomerPhone` INT NULL,
`CustomerAddress` VARCHAR(45) NULL,
PRIMARY KEY (`CustomerEmail`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `BookShop`.`ShoppingBasket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BookShop`.`ShoppingBasket` (
`ShoppingBasketid` INT NOT NULL,
`CustomerEmail` varchar(45) NOT NULL,
PRIMARY KEY (`ShoppingBasketid`, `CustomerEmail`),
INDEX `fk_ShoppingBasket_Customer1_idx` (`CustomerEmail` ASC),
CONSTRAINT `fk_ShoppingBasket_Customer1`
FOREIGN KEY (`CustomerEmail`)
REFERENCES `BookShop`.`Customer` (`CustomerEmail`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
- -----------------------------------------------------
-- Table `BookShop`.`ShoppingBaskets_have_Books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BookShop`.`ShoppingBaskets_have_Books` (
`Book_ISBN` VARCHAR(20) NOT NULL,
`ShoppingBasketid` INT NOT NULL,
`count` INT NOT NULL,
PRIMARY KEY (`Book_ISBN`, `ShoppingBasketid`),
INDEX `fk_Book_has_ShoppingBasket_ShoppingBasket1_idx` (`ShoppingBasketid`
ASC),
INDEX `fk_Book_has_ShoppingBasket_Book1_idx` (`Book_ISBN` ASC),
CONSTRAINT `fk_Book_has_ShoppingBasket_Book1`
FOREIGN KEY (`Book_ISBN`)
REFERENCES `BookShop`.`Book` (`ISBN`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_Book_has_ShoppingBasket_ShoppingBasket1`
FOREIGN KEY (`ShoppingBasketid`)
REFERENCES `BookShop`.`ShoppingBasket` (`ShoppingBasketid`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `BookShop`.`Warehouses_have_Books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BookShop`.`Warehouses_have_Books` (
`Book_ISBN` VARCHAR(20) NOT NULL,
`Warehouse_code` INT NOT NULL,
`count` INT NULL,
PRIMARY KEY (`Book_ISBN`, `Warehouse_code`),
INDEX `fk_Book_has_Warehouse_Warehouse1_idx` (`Warehouse_code` ASC),
INDEX `fk_Book_has_Warehouse_Book1_idx` (`Book_ISBN` ASC),
CONSTRAINT `fk_Book_has_Warehouse_Book1`
FOREIGN KEY (`Book_ISBN`)
REFERENCES `BookShop`.`Book` (`ISBN`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_Book_has_Warehouse_Warehouse1`
FOREIGN KEY (`Warehouse_code`)
REFERENCES `BookShop`.`Warehouse` (`code`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;