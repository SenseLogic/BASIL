set @old_unique_checks=@@unique_checks, unique_checks=0;
set @old_foreign_key_checks=@@foreign_key_checks, foreign_key_checks=0;
set @old_sql_mode=@@sql_mode, sql_mode='traditional,allow_invalid_dates';

create schema if not exists `BLOG` default character set utf8mb4 collate utf8mb4_general_ci;

use `BLOG`;

drop table if exists `BLOG`.`SECTION`;

create table if not exists `BLOG`.`SECTION`(
    `Id` BIGINT UNSIGNED not null auto_increment,
    `Number` BIGINT UNSIGNED null,
    `Slug` TEXT null,
    `Name` VARCHAR( 45 ) null,
    `Text` TEXT null,
    `Image` VARCHAR( 45 ) null,
    primary key( `Id` )
    ) engine = innodb;

drop table if exists `BLOG`.`USER`;

create table if not exists `BLOG`.`USER`(
    `Id` BIGINT UNSIGNED not null auto_increment,
    `FirstName` VARCHAR( 45 ) null,
    `LastName` VARCHAR( 45 ) null,
    `Email` VARCHAR( 45 ) null,
    `Pseudonym` VARCHAR( 45 ) null,
    `Password` VARCHAR( 45 ) null,
    `Phone` VARCHAR( 45 ) null,
    `Street` TEXT null,
    `City` VARCHAR( 45 ) null,
    `Code` VARCHAR( 45 ) null,
    `Region` VARCHAR( 45 ) null,
    `Country` VARCHAR( 45 ) null,
    `Company` VARCHAR( 45 ) null,
    `ItIsAdministrator` TINYINT UNSIGNED null,
    primary key( `Id` )
    ) engine = innodb;

drop table if exists `BLOG`.`ARTICLE`;

create table if not exists `BLOG`.`ARTICLE`(
    `Id` BIGINT UNSIGNED not null auto_increment,
    `SectionId` BIGINT UNSIGNED null,
    `UserId` BIGINT UNSIGNED null,
    `Slug` TEXT null,
    `Title` TEXT null,
    `Text` TEXT null,
    `Image` VARCHAR( 45 ) null,
    `Date` DATE null,
    primary key( `Id` ),
    index `index_article_section_1_idx`( `SectionId` asc ),
    index `index_article_user_2_idx`( `UserId` asc )
    ) engine = innodb;

create table if not exists `BLOG`.`COMMENT`(
    `Id` BIGINT UNSIGNED not null auto_increment,
    `ArticleId` BIGINT UNSIGNED null,
    `UserId` BIGINT UNSIGNED null,
    `Text` TEXT null,
    `DateTime` DATETIME null,
    primary key( `Id` ),
    index `index_comment_article_1_idx`( `ArticleId` asc ),
    index `index_comment_user_2_idx`( `UserId` asc )
    ) engine = innodb;

create table if not exists `BLOG`.`SUBSCRIBER`(
    `Id` BIGINT UNSIGNED not null auto_increment,
    `Name` VARCHAR( 45 ) null,
    `Email` VARCHAR( 45 ) null,
    primary key( `Id` )
    ) engine = innodb;

set sql_mode=@old_sql_mode;
set foreign_key_checks=@old_foreign_key_checks;
set unique_checks=@old_unique_checks;
