set @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
set @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
set @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

create schema if not exists `TEST` default character set utf8mb4 collate utf8mb4_general_ci;

use `TEST`;

create table if not exists `TEST`.`SIMPLE`(
    `Uuid` VARCHAR(36) NOT NULL,
    `Bool` TINYINT UNSIGNED NULL,
    `Int8` TINYINT NULL,
    `Uint8` TINYINT UNSIGNED NULL,
    `Int16` SMALLINT NULL,
    `Uint16` SMALLINT UNSIGNED NULL,
    `Int32` INT NULL,
    `Uint32` INT UNSIGNED NULL,
    `Int64` BIGINT NULL,
    `Uint64` BIGINT UNSIGNED NULL,
    `Float32` FLOAT NULL,
    `Float64` DOUBLE NULL,
    `String` TEXT NULL,
    `Name` TEXT NULL,
    `Date` DATE NULL,
    `DateTime` DATETIME NULL,
    `Blob` BLOB NULL,
    `Option` TEXT NULL,
    `EnglishText` TEXT NULL,
    `FrenchText` TEXT NULL,
    `GermanText` TEXT NULL,
    `LatinText` TEXT NULL,
    `SpanishText` TEXT NULL,
    `Integer` BIGINT NULL,
    `Natural` BIGINT UNSIGNED NULL,
    `Real` DOUBLE NULL,
    `Address` TEXT NULL,
    `CategorySlug` TEXT NULL,
    `CategoryName` TEXT NULL,
    `CategorySection` TEXT NULL,
    primary key( `Uuid` )
    ) engine = InnoDB;

create table if not exists `TEST`.`COMPOUND`(
    `Id` INT NOT NULL AUTO_INCREMENT,
    `Location` TEXT NULL,
    `Name` TEXT NULL,
    `NameSet` TEXT NULL,
    `PhoneList` TEXT NULL,
    `EmailSet` TEXT NULL,
    `CompanyMap` TEXT NULL,
    `SimpleDate` DATE NULL,
    `SimpleDateMap` TEXT NULL,
    `SimpleDateSet` TEXT NULL,
    `SimpleDateList` TEXT NULL,
    `NameSetMap` TEXT NULL,
    `Text` TEXT NULL,
    `TextArray` TEXT NULL,
    `OtherTextArray` TEXT NULL,
    primary key( `Id` )
    ) engine = InnoDB;

create table if not exists `TEST`.`VALUE`(
    `Tuid` VARCHAR(22) NOT NULL,
    `Uuid` VARCHAR(36) NULL,
    `Name` TEXT NULL,
    `Integer` INT NULL,
    `Text` TEXT NULL,
    primary key( `Tuid` )
    ) engine = InnoDB;

create table if not exists `TEST`.`VALUE_DATA`(
    `Uuid` VARCHAR(36) NOT NULL,
    `ValueTuid` VARCHAR(22) NULL,
    `ValueUuid` VARCHAR(36) NULL,
    primary key( `Uuid` )
    ) engine = InnoDB;

set SQL_MODE=@OLD_SQL_MODE;
set FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
set UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
