-- SQL Manager Lite for PostgreSQL 5.7.1.47382
-- ---------------------------------------
-- Host      : localhost
-- Database  : resume
-- Version   : PostgreSQL 9.5.2, compiled by Visual C++ build 1800, 64-bit



SET check_function_bodies = false;
--
-- Structure for table profile (OID = 16701) :
--
SET search_path = public, pg_catalog;
CREATE TABLE public.profile (
    id bigint NOT NULL,
    uid varchar(100) NOT NULL,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    birth_date date,
    phone varchar(20) DEFAULT NULL::character varying,
    email varchar(100) DEFAULT NULL::character varying,
    country varchar(60) DEFAULT NULL::character varying,
    city varchar(100) DEFAULT NULL::character varying,
    objective text,
    summary text,
    large_photo varchar(255) DEFAULT NULL::character varying,
    small_photo varchar(255) DEFAULT NULL::character varying,
    info text,
    password varchar(255) NOT NULL,
    completed boolean NOT NULL,
    created timestamp(0) without time zone DEFAULT now() NOT NULL,
    skype varchar(80) DEFAULT NULL::character varying,
    vkontakte varchar(255) DEFAULT NULL::character varying,
    facebook varchar(255) DEFAULT NULL::character varying,
    linkedin varchar(255) DEFAULT NULL::character varying,
    github varchar(255) DEFAULT NULL::character varying,
    stackoverflow varchar(255) DEFAULT NULL::character varying
)
WITH (oids = false);
--
-- Structure for table certificate (OID = 16728) :
--
CREATE TABLE public.certificate (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    name varchar(50) NOT NULL,
    large_url varchar(255) NOT NULL,
    small_url varchar(255) NOT NULL
)
WITH (oids = false);
--
-- Structure for table course (OID = 16742) :
--
CREATE TABLE public.course (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    name varchar(60) NOT NULL,
    school varchar(60) NOT NULL,
    finish_date date
)
WITH (oids = false);
--
-- Structure for table education (OID = 16754) :
--
CREATE TABLE public.education (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    summary varchar(100) NOT NULL,
    begin_year integer NOT NULL,
    finish_year integer,
    university text NOT NULL,
    faculty varchar(255) NOT NULL
)
WITH (oids = false);
--
-- Structure for table hobby (OID = 16771) :
--
CREATE TABLE public.hobby (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    name varchar(30) NOT NULL
)
WITH (oids = false);
--
-- Structure for table language (OID = 16782) :
--
CREATE TABLE public.language (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    name varchar(30) NOT NULL,
    level varchar(18) NOT NULL,
    type varchar(7) DEFAULT 0 NOT NULL
)
WITH (oids = false);
--
-- Structure for table practic (OID = 16794) :
--
CREATE TABLE public.practic (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    "position" varchar(100) NOT NULL,
    company varchar(100) NOT NULL,
    begin_date date NOT NULL,
    finish_date date,
    responsibilities text NOT NULL,
    demo varchar(255) DEFAULT NULL::character varying,
    src varchar(255) DEFAULT NULL::character varying
)
WITH (oids = false);
--
-- Structure for table skill (OID = 16811) :
--
CREATE TABLE public.skill (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    category varchar(50) NOT NULL,
    value text NOT NULL
)
WITH (oids = false);
--
-- Structure for table profile_restore (OID = 16825) :
--
CREATE TABLE public.profile_restore (
    id bigint NOT NULL,
    token varchar(255) NOT NULL
)
WITH (oids = false);
--
-- Structure for table skill_category (OID = 16837) :
--
CREATE TABLE public.skill_category (
    id bigint NOT NULL,
    category varchar(50) NOT NULL
)
WITH (oids = false);
--
-- Definition for sequence certificate_seq (OID = 16844) :
--
CREATE SEQUENCE public.certificate_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence course_seq (OID = 16846) :
--
CREATE SEQUENCE public.course_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence education_seq (OID = 16848) :
--
CREATE SEQUENCE public.education_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence hobby_seq (OID = 16850) :
--
CREATE SEQUENCE public.hobby_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence language_seq (OID = 16852) :
--
CREATE SEQUENCE public.language_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence practic_seq (OID = 16855) :
--
CREATE SEQUENCE public.practic_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence profile_seq (OID = 16857) :
--
CREATE SEQUENCE public.profile_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence skill_seq (OID = 16859) :
--
CREATE SEQUENCE public.skill_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for index education_idx1 (OID = 16769) :
--
CREATE INDEX education_idx1 ON education USING btree (finish_year);
--
-- Definition for index course_idx1 (OID = 16770) :
--
CREATE INDEX course_idx1 ON course USING btree (finish_date);
--
-- Definition for index practic_idx1 (OID = 16810) :
--
CREATE INDEX practic_idx1 ON practic USING btree (finish_date);
--
-- Definition for index profile_pkey (OID = 16720) :
--
ALTER TABLE ONLY profile
    ADD CONSTRAINT profile_pkey
    PRIMARY KEY (id);
--
-- Definition for index profile_uid_key (OID = 16722) :
--
ALTER TABLE ONLY profile
    ADD CONSTRAINT profile_uid_key
    UNIQUE (uid);
--
-- Definition for index profile_phone_key (OID = 16724) :
--
ALTER TABLE ONLY profile
    ADD CONSTRAINT profile_phone_key
    UNIQUE (phone);
--
-- Definition for index profile_email_key (OID = 16726) :
--
ALTER TABLE ONLY profile
    ADD CONSTRAINT profile_email_key
    UNIQUE (email);
--
-- Definition for index certificate_pkey (OID = 16734) :
--
ALTER TABLE ONLY certificate
    ADD CONSTRAINT certificate_pkey
    PRIMARY KEY (id);
--
-- Definition for index certificate_fk (OID = 16736) :
--
ALTER TABLE ONLY certificate
    ADD CONSTRAINT certificate_fk
    FOREIGN KEY (id_profile) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;
--
-- Definition for index course_pkey (OID = 16745) :
--
ALTER TABLE ONLY course
    ADD CONSTRAINT course_pkey
    PRIMARY KEY (id);
--
-- Definition for index course_fk (OID = 16747) :
--
ALTER TABLE ONLY course
    ADD CONSTRAINT course_fk
    FOREIGN KEY (id_profile) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;
--
-- Definition for index education_pkey (OID = 16760) :
--
ALTER TABLE ONLY education
    ADD CONSTRAINT education_pkey
    PRIMARY KEY (id);
--
-- Definition for index education_fk (OID = 16762) :
--
ALTER TABLE ONLY education
    ADD CONSTRAINT education_fk
    FOREIGN KEY (id_profile) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;
--
-- Definition for index hobby_pkey (OID = 16774) :
--
ALTER TABLE ONLY hobby
    ADD CONSTRAINT hobby_pkey
    PRIMARY KEY (id);
--
-- Definition for index hobby_fk (OID = 16776) :
--
ALTER TABLE ONLY hobby
    ADD CONSTRAINT hobby_fk
    FOREIGN KEY (id_profile) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;
--
-- Definition for index language_pkey (OID = 16786) :
--
ALTER TABLE ONLY language
    ADD CONSTRAINT language_pkey
    PRIMARY KEY (id);
--
-- Definition for index language_fk (OID = 16788) :
--
ALTER TABLE ONLY language
    ADD CONSTRAINT language_fk
    FOREIGN KEY (id_profile) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;
--
-- Definition for index practic_pkey (OID = 16802) :
--
ALTER TABLE ONLY practic
    ADD CONSTRAINT practic_pkey
    PRIMARY KEY (id);
--
-- Definition for index practic_fk (OID = 16804) :
--
ALTER TABLE ONLY practic
    ADD CONSTRAINT practic_fk
    FOREIGN KEY (id_profile) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;
--
-- Definition for index skill_pkey (OID = 16817) :
--
ALTER TABLE ONLY skill
    ADD CONSTRAINT skill_pkey
    PRIMARY KEY (id);
--
-- Definition for index skill_fk (OID = 16819) :
--
ALTER TABLE ONLY skill
    ADD CONSTRAINT skill_fk
    FOREIGN KEY (id_profile) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;
--
-- Definition for index profile_restore_pkey (OID = 16828) :
--
ALTER TABLE ONLY profile_restore
    ADD CONSTRAINT profile_restore_pkey
    PRIMARY KEY (id);
--
-- Definition for index profile_restore_token_key (OID = 16830) :
--
ALTER TABLE ONLY profile_restore
    ADD CONSTRAINT profile_restore_token_key
    UNIQUE (token);
--
-- Definition for index profile_restore_fk (OID = 16832) :
--
ALTER TABLE ONLY profile_restore
    ADD CONSTRAINT profile_restore_fk
    FOREIGN KEY (id) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;
--
-- Definition for index skill_category_pkey (OID = 16840) :
--
ALTER TABLE ONLY skill_category
    ADD CONSTRAINT skill_category_pkey
    PRIMARY KEY (id);
--
-- Definition for index skill_category_category_key (OID = 16842) :
--
ALTER TABLE ONLY skill_category
    ADD CONSTRAINT skill_category_category_key
    UNIQUE (category);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
