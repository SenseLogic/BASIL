set @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
set @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
set @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

drop schema if exists `TEST`;

create schema if not exists `TEST` default character set utf8 collate utf8_general_ci;

use `TEST`;

drop table if exists `TEST`.`ITEM`;

create table if not exists `TEST`.`ITEM`(
    `Uuid` BINARY(16) NOT NULL,
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
    `Date` DATE NULL,
    `DateTime` DATETIME NULL,
    `Blob` BLOB NULL,
    primary key( `Uuid` )
    ) engine = InnoDB;

drop table if exists `TEST`.`COLLECTION`;

create table if not exists `TEST`.`COLLECTION`(
    `Id` INT NOT NULL AUTO_INCREMENT,
    `Tuple` TEXT NULL,
    `Map` TEXT NULL,
    `Set` TEXT NULL,
    `List` TEXT NULL,
    `ItemUuid` BINARY(16) NULL,
    `ItemList` TEXT NULL,
    primary key( `Id` ),
    index `fk_collection_item_1_idx`( `ItemUuid` ASC ),
    constraint `fk_collection_item_1`
    foreign key( `ItemUuid` )
    references `TEST`.`ITEM`( `Uuid` )
        on delete set null
        on update no action
    ) engine = InnoDB;

set SQL_MODE=@OLD_SQL_MODE;
set FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
set UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
