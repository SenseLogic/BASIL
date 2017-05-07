set @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
set @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
set @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

drop schema if exists `BLOG`;

create schema if not exists `BLOG` default character set utf8 collate utf8_general_ci;

use `BLOG`;

drop table if exists `BLOG`.`SECTION`;

create table if not exists `BLOG`.`SECTION`(
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Number` BIGINT UNSIGNED NULL,
  `Name` VARCHAR( 45 ) NULL,
  `Text` TEXT NULL,
  `Image` VARCHAR( 45 ) NULL,
  `ArticleIdList` TEXT NULL,
  primary key( `Id` ) )
engine = InnoDB;

drop table if exists `BLOG`.`USER`;

create table if not exists `BLOG`.`USER`(
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR( 45 ) NULL,
  `Pseudonym` VARCHAR( 45 ) NULL,
  `Password` VARCHAR( 45 ) NULL,
  `ItIsAdministrator` TINYINT UNSIGNED NULL,
  primary key( `Id` ) )
engine = InnoDB;

drop table if exists `BLOG`.`ARTICLE`;

create table if not exists `BLOG`.`ARTICLE`(
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `SectionId` TEXT NULL,
  `UserId` TEXT NULL,
  `Title` TEXT NULL,
  `Text` TEXT NULL,
  `Image` VARCHAR( 45 ) NULL,
  `Date` DATETIME NULL,
  primary key( `Id` ),
  index `fk_article_section_1_idx`( `SectionId` ASC ),
  index `fk_article_user_2_idx`( `UserId` ASC ),
  constraint `fk_article_section_1`
    foreign key( `SectionId` )
    references `BLOG`.`SECTION`( `Id` )
    on delete set null
    on update no action,
  constraint `fk_article_user_2`
    foreign key( `UserId` )
    references `BLOG`.`USER`( `Id` )
    on delete set null
    on update no action )
engine = InnoDB;

drop table if exists `BLOG`.`COMMENT`;

create table if not exists `BLOG`.`COMMENT`(
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ArticleId` TEXT NULL,
  `UserId` TEXT NULL,
  `Text` TEXT NULL,
  `Date` DATE NULL,
  primary key( `Id` ),
  index `fk_comment_article_1_idx`( `ArticleId` ASC ),
  index `fk_comment_user_2_idx`( `UserId` ASC ),
  constraint `fk_comment_article_1`
    foreign key( `ArticleId` )
    references `BLOG`.`ARTICLE`( `Id` )
    on delete set null
    on update no action,
  constraint `fk_comment_user_2`
    foreign key( `UserId` )
    references `BLOG`.`USER`( `Id` )
    on delete set null
    on update no action )
engine = InnoDB;

drop table if exists `BLOG`.`SUBSCRIBER`;

create table if not exists `BLOG`.`SUBSCRIBER`(
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR( 45 ) NULL,
  `Email` VARCHAR( 45 ) NULL,
  primary key( `Id` ) )
engine = InnoDB;

set SQL_MODE=@OLD_SQL_MODE;
set FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
set UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
