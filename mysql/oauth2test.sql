-- MySQL Script generated by MySQL Workbench
-- Sat Aug 25 11:36:28 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema oauth2test
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema oauth2test
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `oauth2test` DEFAULT CHARACTER SET utf8 ;
USE `oauth2test` ;

-- -----------------------------------------------------
-- Table `oauth2test`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oauth2test`.`users` (
  `username` VARCHAR(45) NOT NULL,
  `user_password` VARCHAR(45) NULL,
  PRIMARY KEY (`username`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oauth2test`.`access_tokens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oauth2test`.`access_tokens` (
  `access_token` VARCHAR(255) NOT NULL,
  `user_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`access_token`),
  UNIQUE INDEX `access_token_UNIQUE` (`access_token` ASC),
  INDEX `fk_access_tokens_users_idx` (`user_id` ASC),
  CONSTRAINT `fk_access_tokens_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `oauth2test`.`users` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
