set @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
set @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
set @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

create schema if not exists `BLOG` default character set utf8mb4 collate utf8mb4_general_ci;

use `BLOG`;

drop table if exists `BLOG`.`SECTION`;

create table if not exists `BLOG`.`SECTION`(
    `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Number` BIGINT UNSIGNED NULL,
    `Slug` TEXT NULL,
    `Name` VARCHAR( 45 ) NULL,
    `Text` TEXT NULL,
    `Image` VARCHAR( 45 ) NULL,
    primary key( `Id` )
    ) engine = InnoDB;

drop table if exists `BLOG`.`USER`;

create table if not exists `BLOG`.`USER`(
    `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `FirstName` VARCHAR( 45 ) NULL,
    `LastName` VARCHAR( 45 ) NULL,
    `Email` VARCHAR( 45 ) NULL,
    `Pseudonym` VARCHAR( 45 ) NULL,
    `Password` VARCHAR( 45 ) NULL,
    `Phone` VARCHAR( 45 ) NULL,
    `Street` TEXT NULL,
    `City` VARCHAR( 45 ) NULL,
    `Code` VARCHAR( 45 ) NULL,
    `Region` VARCHAR( 45 ) NULL,
    `Country` VARCHAR( 45 ) NULL,
    `Company` VARCHAR( 45 ) NULL,
    `ItIsAdministrator` TINYINT UNSIGNED NULL,
    primary key( `Id` )
    ) engine = InnoDB;

drop table if exists `BLOG`.`ARTICLE`;

create table if not exists `BLOG`.`ARTICLE`(
    `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `SectionId` BIGINT UNSIGNED NULL,
    `UserId` BIGINT UNSIGNED NULL,
    `Slug` TEXT NULL,
    `Title` TEXT NULL,
    `Text` TEXT NULL,
    `Image` VARCHAR( 45 ) NULL,
    `Date` DATE NULL,
    primary key( `Id` ),
    index `index_article_section_1_idx`( `SectionId` ASC ),
    index `index_article_user_2_idx`( `UserId` ASC )
    ) engine = InnoDB;

create table if not exists `BLOG`.`COMMENT`(
    `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ArticleId` BIGINT UNSIGNED NULL,
    `UserId` BIGINT UNSIGNED NULL,
    `Text` TEXT NULL,
    `DateTime` DATETIME NULL,
    primary key( `Id` ),
    index `index_comment_article_1_idx`( `ArticleId` ASC ),
    index `index_comment_user_2_idx`( `UserId` ASC )
    ) engine = InnoDB;

create table if not exists `BLOG`.`SUBSCRIBER`(
    `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR( 45 ) NULL,
    `Email` VARCHAR( 45 ) NULL,
    primary key( `Id` )
    ) engine = InnoDB;

set SQL_MODE=@OLD_SQL_MODE;
set FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
set UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
