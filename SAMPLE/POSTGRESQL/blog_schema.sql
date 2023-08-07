create schema if not exists "BLOG";

set search_path to "BLOG";

drop table if exists "BLOG"."SECTION";

create table if not exists "BLOG"."SECTION"(
    "Id" BIGINT not null primary key,
    "Number" BIGINT null,
    "Slug" TEXT null,
    "Name" VARCHAR( 45 ) null,
    "Text" TEXT null,
    "Image" VARCHAR( 45 ) null
    );

drop table if exists "BLOG"."USER";

create table if not exists "BLOG"."USER"(
    "Id" BIGINT not null primary key,
    "FirstName" VARCHAR( 45 ) null,
    "LastName" VARCHAR( 45 ) null,
    "Email" VARCHAR( 45 ) null,
    "Pseudonym" VARCHAR( 45 ) null,
    "Password" VARCHAR( 45 ) null,
    "Phone" VARCHAR( 45 ) null,
    "Street" TEXT null,
    "City" VARCHAR( 45 ) null,
    "Code" VARCHAR( 45 ) null,
    "Region" VARCHAR( 45 ) null,
    "Country" VARCHAR( 45 ) null,
    "Company" VARCHAR( 45 ) null,
    "ItIsAdministrator" SMALLINT null
    );

drop table if exists "BLOG"."ARTICLE";

create table if not exists "BLOG"."ARTICLE"(
    "Id" BIGINT not null primary key,
    "SectionId" BIGINT null,
    "UserId" BIGINT null,
    "Slug" TEXT null,
    "Title" TEXT null,
    "Text" TEXT null,
    "Image" VARCHAR( 45 ) null,
    "Date" DATE null,
    index `index_article_section_1_idx`( "SectionId" asc ),
    index `index_article_user_2_idx`( "UserId" asc )
    );

create table if not exists "BLOG"."COMMENT"(
    "Id" BIGINT not null primary key,
    "ArticleId" BIGINT null,
    "UserId" BIGINT null,
    "Text" TEXT null,
    "DateTime" TIMESTAMP null,
    index `index_comment_article_1_idx`( "ArticleId" asc ),
    index `index_comment_user_2_idx`( "UserId" asc )
    );

create table if not exists "BLOG"."SUBSCRIBER"(
    "Id" BIGINT not null primary key,
    "Name" VARCHAR( 45 ) null,
    "Email" VARCHAR( 45 ) null
    );
