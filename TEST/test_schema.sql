set @old_unique_checks=@@unique_checks, unique_checks=0;
set @old_foreign_key_checks=@@foreign_key_checks, foreign_key_checks=0;
set @old_sql_mode=@@sql_mode, sql_mode='traditional,allow_invalid_dates';

create schema if not exists `TEST` default character set utf8mb4 collate utf8mb4_general_ci;

use `TEST`;

create table if not exists `TEST`.`SIMPLE`(
    `Uuid` VARCHAR(36) not null,
    `Bool` TINYINT UNSIGNED null,
    `Int8` TINYINT null,
    `Uint8` TINYINT UNSIGNED null,
    `Int16` SMALLINT null,
    `Uint16` SMALLINT UNSIGNED null,
    `Int32` INT null,
    `Uint32` INT UNSIGNED null,
    `Int64` BIGINT null,
    `Uint64` BIGINT UNSIGNED null,
    `Float32` FLOAT null,
    `Float64` DOUBLE null,
    `String` TEXT null,
    `Name` TEXT null,
    `Date` DATE null,
    `DateTime` DATETIME null,
    `Blob` BLOB null,
    `Option` TEXT null,
    `EnglishText` TEXT null,
    `FrenchText` TEXT null,
    `GermanText` TEXT null,
    `LatinText` TEXT null,
    `SpanishText` TEXT null,
    `Integer` BIGINT null,
    `Natural` BIGINT UNSIGNED null,
    `Real` DOUBLE null,
    `Address` TEXT null,
    `CategorySlug` TEXT null,
    `CategoryName` TEXT null,
    `CategorySection` TEXT null,
    primary key( `Uuid` )
    ) engine = innodb;

create table if not exists `TEST`.`COMPOUND`(
    `Id` INT not null auto_increment,
    `Location` TEXT null,
    `Name` TEXT null,
    `NameSet` TEXT null,
    `PhoneList` TEXT null,
    `EmailSet` TEXT null,
    `CompanyMap` TEXT null,
    `SimpleDate` DATE null,
    `SimpleDateMap` TEXT null,
    `SimpleDateSet` TEXT null,
    `SimpleDateList` TEXT null,
    `NameSetMap` TEXT null,
    `Text` TEXT null,
    `TextArray` TEXT null,
    `OtherTextArray` TEXT null,
    primary key( `Id` )
    ) engine = innodb;

create table if not exists `TEST`.`VALUE`(
    `Tuid` VARCHAR(22) not null,
    `Uuid` VARCHAR(36) null,
    `Name` TEXT null,
    `Integer` INT null,
    `Text` TEXT null,
    primary key( `Tuid` )
    ) engine = innodb;

create table if not exists `TEST`.`VALUE_DATA`(
    `Uuid` VARCHAR(36) not null,
    `ValueTuid` VARCHAR(22) null,
    `ValueUuid` VARCHAR(36) null,
    primary key( `Uuid` )
    ) engine = innodb;

set sql_mode=@old_sql_mode;
set foreign_key_checks=@old_foreign_key_checks;
set unique_checks=@old_unique_checks;
