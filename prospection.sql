-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema prospection
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema prospection
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `prospection` DEFAULT CHARACTER SET utf8 ;
USE `prospection` ;

-- -----------------------------------------------------
-- Table `prospection`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`article` (
  `id_article` INT NOT NULL AUTO_INCREMENT,
  `name_article` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_article`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `prospection`.`boost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`boost` (
  `id_boost` INT NOT NULL AUTO_INCREMENT,
  `date_boost` DATE NULL DEFAULT NULL,
  `result_boost` ENUM('-', 'NON', 'RDV') NULL DEFAULT NULL,
  PRIMARY KEY (`id_boost`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `prospection`.`bulk`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`bulk` (
  `id_bulk` INT NOT NULL AUTO_INCREMENT,
  `measure_bulk` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_bulk`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `prospection`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`invoice` (
  `id_invoice` INT NOT NULL AUTO_INCREMENT,
  `number_invoice` VARCHAR(45) NOT NULL,
  `date_invoice` DATE NOT NULL,
  `total_invoice` INT NOT NULL,
  PRIMARY KEY (`id_invoice`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `prospection`.`mailing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`mailing` (
  `id_mailing` INT NOT NULL AUTO_INCREMENT,
  `date_mailing` DATE NULL DEFAULT NULL,
  `result_mailing` ENUM('-', 'NPAI', 'NON', 'RDV') NULL DEFAULT NULL,
  PRIMARY KEY (`id_mailing`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `prospection`.`ordered`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`ordered` (
  `id_ordered` INT NOT NULL AUTO_INCREMENT,
  `date_ordered` DATE NULL DEFAULT NULL,
  `result_ordered` ENUM('-', 'XPF') NULL DEFAULT NULL,
  `invoice_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_ordered`),
  INDEX `fk_ordered_invoice1_idx` (`invoice_id` ASC),
  CONSTRAINT `fk_ordered_invoice1`
    FOREIGN KEY (`invoice_id`)
    REFERENCES `prospection`.`invoice` (`id_invoice`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `prospection`.`price`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`price` (
  `id_price` INT NOT NULL AUTO_INCREMENT,
  `value_price` INT NOT NULL,
  PRIMARY KEY (`id_price`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `prospection`.`quote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`quote` (
  `id_quote` INT NOT NULL AUTO_INCREMENT,
  `number_quote` VARCHAR(45) NOT NULL,
  `date_quote` DATE NOT NULL,
  `total_quote` INT NOT NULL,
  PRIMARY KEY (`id_quote`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `prospection`.`visit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`visit` (
  `id_visit` INT NOT NULL AUTO_INCREMENT,
  `date_visit` DATE NULL DEFAULT NULL,
  `result_visit` ENUM('-', 'NON', 'Accord', 'Devis') NULL DEFAULT NULL,
  `quote_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_visit`),
  INDEX `fk_visit_quote1_idx` (`quote_id` ASC),
  CONSTRAINT `fk_visit_quote1`
    FOREIGN KEY (`quote_id`)
    REFERENCES `prospection`.`quote` (`id_quote`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `prospection`.`prospect`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`prospect` (
  `id_prospect` INT NOT NULL AUTO_INCREMENT,
  `name_prospect` VARCHAR(45) NOT NULL,
  `address_prospect` VARCHAR(45) NULL DEFAULT NULL,
  `mail_prospect` VARCHAR(45) NULL DEFAULT NULL,
  `tel_prospect` VARCHAR(45) NULL DEFAULT NULL,
  `mailing_id` INT NULL DEFAULT NULL,
  `ordered_id` INT NULL DEFAULT NULL,
  `visit_id` INT NULL DEFAULT NULL,
  `boost_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_prospect`),
  INDEX `fk_prospect_mailing1_idx` (`mailing_id` ASC),
  INDEX `fk_prospect_ordered1_idx` (`ordered_id` ASC),
  INDEX `fk_prospect_visit1_idx` (`visit_id` ASC),
  INDEX `fk_prospect_boost1_idx` (`boost_id` ASC),
  CONSTRAINT `fk_prospect_boost1`
    FOREIGN KEY (`boost_id`)
    REFERENCES `prospection`.`boost` (`id_boost`),
  CONSTRAINT `fk_prospect_mailing1`
    FOREIGN KEY (`mailing_id`)
    REFERENCES `prospection`.`mailing` (`id_mailing`),
  CONSTRAINT `fk_prospect_ordered1`
    FOREIGN KEY (`ordered_id`)
    REFERENCES `prospection`.`ordered` (`id_ordered`),
  CONSTRAINT `fk_prospect_visit1`
    FOREIGN KEY (`visit_id`)
    REFERENCES `prospection`.`visit` (`id_visit`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `prospection`.`article_has_price`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`article_has_price` (
  `id_article_has_price` INT NOT NULL AUTO_INCREMENT,
  `article_id_article` INT NOT NULL,
  `price_id_price` INT NOT NULL,
  `bulk_id_bulk` INT NOT NULL,
  INDEX `fk_article_has_price_price1_idx` (`price_id_price` ASC),
  INDEX `fk_article_has_price_article1_idx` (`article_id_article` ASC),
  INDEX `fk_article_has_price_bulk1_idx` (`bulk_id_bulk` ASC),
  PRIMARY KEY (`id_article_has_price`),
  CONSTRAINT `fk_article_has_price_article1`
    FOREIGN KEY (`article_id_article`)
    REFERENCES `prospection`.`article` (`id_article`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_article_has_price_price1`
    FOREIGN KEY (`price_id_price`)
    REFERENCES `prospection`.`price` (`id_price`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_article_has_price_bulk1`
    FOREIGN KEY (`bulk_id_bulk`)
    REFERENCES `prospection`.`bulk` (`id_bulk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `prospection`.`invoice_has_article_has_price`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`invoice_has_article_has_price` (
  `id_invoice_has_article_has_price` INT NOT NULL AUTO_INCREMENT,
  `invoice_id_invoice` INT NOT NULL,
  `article_has_price_id_article_has_price` INT NOT NULL,
  INDEX `fk_invoice_has_article_has_price_article_has_price1_idx` (`article_has_price_id_article_has_price` ASC),
  INDEX `fk_invoice_has_article_has_price_invoice1_idx` (`invoice_id_invoice` ASC),
  PRIMARY KEY (`id_invoice_has_article_has_price`),
  CONSTRAINT `fk_invoice_has_article_has_price_invoice1`
    FOREIGN KEY (`invoice_id_invoice`)
    REFERENCES `prospection`.`invoice` (`id_invoice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoice_has_article_has_price_article_has_price1`
    FOREIGN KEY (`article_has_price_id_article_has_price`)
    REFERENCES `prospection`.`article_has_price` (`id_article_has_price`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `prospection`.`quote_has_article_has_price`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`quote_has_article_has_price` (
  `id_quote_has_article` INT NOT NULL AUTO_INCREMENT,
  `quote_id_quote` INT NOT NULL,
  `article_has_price_id_article_has_price` INT NOT NULL,
  INDEX `fk_quote_has_article_has_price_article_has_price1_idx` (`article_has_price_id_article_has_price` ASC),
  INDEX `fk_quote_has_article_has_price_quote1_idx` (`quote_id_quote` ASC),
  PRIMARY KEY (`id_quote_has_article`),
  CONSTRAINT `fk_quote_has_article_has_price_quote1`
    FOREIGN KEY (`quote_id_quote`)
    REFERENCES `prospection`.`quote` (`id_quote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_quote_has_article_has_price_article_has_price1`
    FOREIGN KEY (`article_has_price_id_article_has_price`)
    REFERENCES `prospection`.`article_has_price` (`id_article_has_price`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
