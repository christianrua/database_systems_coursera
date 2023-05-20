-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS,
FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE,
SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema olap_bookshop
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema olap_bookshop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `olap_bookshop` DEFAULT CHARACTER SET
utf8 ;
USE `olap_bookshop` ;
-- -----------------------------------------------------
-- Table `olap_bookshop`.`REGION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `olap_bookshop`.`region` (
`region_id` INT NOT NULL,
`region_name` VARCHAR(20) NOT NULL,
PRIMARY KEY (`region_id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `olap_bookshop`.`SUBREGION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `olap_bookshop`.`subregion` (
`subregion_id` INT NOT NULL,
`subregion_name` VARCHAR(30) NOT NULL,
`region_id` INT NOT NULL,
PRIMARY KEY (`subregion_id`, `region_id`),
INDEX `fk_SUBREGION_REGION_idx` (`region_id` ASC) VISIBLE,
CONSTRAINT `fk_SUBREGION_REGION`
FOREIGN KEY (`region_id`)
REFERENCES `olap_bookshop`.`region` (`region_id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `olap_bookshop`.`WAREHOUSE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `olap_bookshop`.`warehouse` (
`code` INT NOT NULL,
`subregion_id` INT NOT NULL,
PRIMARY KEY (`code`, `subregion_id`),
INDEX `fk_WAREHOUSE_SUBREGION1_idx` (`subregion_id` ASC)
VISIBLE,
CONSTRAINT `fk_WAREHOUSE_SUBREGION1`
FOREIGN KEY (`subregion_id`)
REFERENCES `olap_bookshop`.`subregion` (`subregion_id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `olap_bookshop`.`BOOKS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `olap_bookshop`.`books` (
`isbn` BIGINT NOT NULL,
`title` VARCHAR(45) NULL,
`price` VARCHAR(45) NULL,
PRIMARY KEY (`isbn`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `olap_bookshop`.`YEAR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `olap_bookshop`.`year` (
`year_id` INT NOT NULL,
`year` YEAR(4) NULL,
PRIMARY KEY (`year_id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `olap_bookshop`.`MONTH`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `olap_bookshop`.`month` (
`month_id` INT NOT NULL,
`month` VARCHAR(15) NULL,
`year_id` INT NOT NULL,
PRIMARY KEY (`month_id`, `year_id`),
INDEX `fk_MONTH_YEAR1_idx` (`year_id` ASC) VISIBLE,
CONSTRAINT `fk_MONTH_YEAR1`
FOREIGN KEY (`year_id`)
REFERENCES `olap_bookshop`.`year` (`year_id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `olap_bookshop`.`DAY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `olap_bookshop`.`day` (
`num_day` INT NOT NULL,
`day_id` VARCHAR(45) NOT NULL,
`day` VARCHAR(45) NOT NULL,
`month_id` INT NOT NULL,
PRIMARY KEY (`day_id`, `month_id`),
INDEX `fk_DAY_MONTH1_idx` (`month_id` ASC) VISIBLE,
CONSTRAINT `fk_DAY_MONTH1`
FOREIGN KEY (`month_id`)
REFERENCES `olap_bookshop`.`month` (`month_id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `olap_bookshop`.`FACTS_TICKET`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `olap_bookshop`.`facts_ticket` (
`sell_by_product` INT NOT NULL,
`ticket_number` INT NOT NULL,
`books_isbn` BIGINT NOT NULL,
`warehouse_code` INT NOT NULL,
`day_id` VARCHAR(45) NOT NULL,
PRIMARY KEY (`sell_by_product`, `books_isbn`, `warehouse_code`,
`day_id`),
INDEX `fk_FACTS_TICKET_BOOKS1_idx` (`books_isbn` ASC) VISIBLE,
INDEX `fk_FACTS_TICKET_WAREHOUSE1_idx` (`warehouse_code` ASC)
VISIBLE,
INDEX `fk_FACTS_TICKET_DAY1_idx` (`day_id` ASC) VISIBLE,
CONSTRAINT `fk_FACTS_TICKET_BOOKS1`
FOREIGN KEY (`books_isbn`)
REFERENCES `olap_bookshop`.`books` (`isbn`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_FACTS_TICKET_WAREHOUSE1`
FOREIGN KEY (`warehouse_code`)
REFERENCES `olap_bookshop`.`warehouse` (`code`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_FACTS_TICKET_DAY1`
FOREIGN KEY (`DAY_ID`)
REFERENCES `olap_bookshop`.`day` (`day_id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;