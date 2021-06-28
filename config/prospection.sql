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
-- Table `prospection`.`prospect`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`prospect` (
  `id_prospect` INT NOT NULL AUTO_INCREMENT,
  `name_prospect` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_prospect`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prospection`.`mailing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`mailing` (
  `id_mailing` INT NOT NULL AUTO_INCREMENT,
  `date_mailing` DATE NULL,
  `result_mailing` ENUM(' ', '-', 'N.P.A.I', 'NON', 'RDV', 'Devis', 'Commande') NULL,
  `date_rdv_mailing` DATE NULL,
  `prospect_id_prospect` INT NOT NULL,
  PRIMARY KEY (`id_mailing`),
  INDEX `fk_mailing_prospect1_idx` (`prospect_id_prospect` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prospection`.`relance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`relance` (
  `id_relance` INT NOT NULL AUTO_INCREMENT,
  `date_relance` DATE NULL,
  `result_relance` ENUM(' ', '-', 'NON', 'RDV', 'Devis', 'Commande') NULL,
  `date_rdv_relance` DATE NULL,
  `prospect_id_prospect` INT NOT NULL,
  PRIMARY KEY (`id_relance`),
  INDEX `fk_relance_prospect_idx` (`prospect_id_prospect` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prospection`.`visite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`visite` (
  `id_visite` INT NOT NULL AUTO_INCREMENT,
  `date_visite` DATE NULL,
  `result_visite` ENUM(' ', '-', 'NON', 'Devis', 'Commande') NULL,
  `prospect_id_prospect` INT NOT NULL,
  PRIMARY KEY (`id_visite`),
  INDEX `fk_visite_prospect1_idx` (`prospect_id_prospect` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prospection`.`commande`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`commande` (
  `id_commande` INT NOT NULL AUTO_INCREMENT,
  `date_commande` DATE NULL,
  `price_commande` INT(11) NULL,
  `prospect_id_prospect` INT NOT NULL,
  PRIMARY KEY (`id_commande`),
  INDEX `fk_commande_prospect1_idx` (`prospect_id_prospect` ASC))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
