DROP DATABASE popyvanov;
--
-- Name: popyvanov; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE popyvanov WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';


ALTER DATABASE popyvanov OWNER TO postgres;

\connect popyvanov

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: championships_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE championships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE championships_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: championships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE championships (
    id integer DEFAULT nextval('championships_id_seq'::regclass) NOT NULL,
    id_type integer NOT NULL,
    year smallint NOT NULL,
    id_country integer NOT NULL,
    city character varying(30) NOT NULL,
    CONSTRAINT championships_id_check CHECK ((id > 0)),
    CONSTRAINT championships_year_check CHECK ((year > 1900))
);


ALTER TABLE championships OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countries_id_seq OWNER TO postgres;

--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE countries (
    id integer DEFAULT nextval('countries_id_seq'::regclass) NOT NULL,
    name character varying(30),
    CONSTRAINT countries_id_check CHECK ((id > 0))
);


ALTER TABLE countries OWNER TO postgres;

--
-- Name: styles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE styles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE styles_id_seq OWNER TO postgres;

--
-- Name: styles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE styles (
    id integer DEFAULT nextval('styles_id_seq'::regclass) NOT NULL,
    name character varying(30),
    CONSTRAINT styles_id_check CHECK ((id > 0))
);


ALTER TABLE styles OWNER TO postgres;

--
-- Name: styles_swimmer_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE styles_swimmer_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE styles_swimmer_relations_id_seq OWNER TO postgres;

--
-- Name: styles_swimmer_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE styles_swimmer_relations (
    id integer DEFAULT nextval('styles_swimmer_relations_id_seq'::regclass) NOT NULL,
    id_styles integer NOT NULL,
    id_swimmer integer NOT NULL,
    CONSTRAINT styles_swimmer_relations_id_check CHECK ((id > 0))
);


ALTER TABLE styles_swimmer_relations OWNER TO postgres;

--
-- Name: swimmer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE swimmer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE swimmer_id_seq OWNER TO postgres;

--
-- Name: swimmer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE swimmer (
    id integer DEFAULT nextval('swimmer_id_seq'::regclass) NOT NULL,
    name character varying(30) NOT NULL,
    second_name character varying(30) NOT NULL,
    sex character varying(6),
    id_country integer NOT NULL,
    date_birth date NOT NULL,
    weight integer NOT NULL,
    growth integer NOT NULL,
    main_style_id integer NOT NULL,
    olympic_champion integer,
    world_champion integer,
    world_records integer,
    CONSTRAINT swimmer_growth_check CHECK ((growth > 0)),
    CONSTRAINT swimmer_id_check CHECK ((id > 0)),
    CONSTRAINT swimmer_olympic_champion_check CHECK ((olympic_champion > '-1'::integer)),
    CONSTRAINT swimmer_weight_check CHECK ((weight > 0)),
    CONSTRAINT swimmer_world_champion_check CHECK ((world_champion > '-1'::integer)),
    CONSTRAINT swimmer_world_records_check CHECK ((world_records > '-1'::integer))
);


ALTER TABLE swimmer OWNER TO postgres;

--
-- Name: swimmer_championships_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE swimmer_championships_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE swimmer_championships_relations_id_seq OWNER TO postgres;

--
-- Name: swimmer_championships_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE swimmer_championships_relations (
    id integer DEFAULT nextval('swimmer_championships_relations_id_seq'::regclass) NOT NULL,
    id_swimmer integer NOT NULL,
    id_championship integer NOT NULL,
    CONSTRAINT swimmer_championships_relations_id_check CHECK ((id > 0))
);


ALTER TABLE swimmer_championships_relations OWNER TO postgres;

--
-- Name: type_of_championship_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE type_of_championship_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE type_of_championship_id_seq OWNER TO postgres;

--
-- Name: type_of_championship; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE type_of_championship (
    id integer DEFAULT nextval('type_of_championship_id_seq'::regclass) NOT NULL,
    name character varying(30) NOT NULL,
    CONSTRAINT type_of_championship_id_check CHECK ((id > 0))
);


ALTER TABLE type_of_championship OWNER TO postgres;

--
-- Data for Name: championships; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO championships VALUES (1, 1, 1999, 9, 'Hong_Kong');
INSERT INTO championships VALUES (2, 1, 2002, 1, 'Mosбow');
INSERT INTO championships VALUES (3, 1, 2004, 2, 'Indianapolis');
INSERT INTO championships VALUES (4, 1, 2006, 9, 'Shanghai');
INSERT INTO championships VALUES (5, 1, 2008, 10, 'Manchester');
INSERT INTO championships VALUES (6, 1, 2010, 8, 'Dubai');
INSERT INTO championships VALUES (7, 1, 2012, 5, 'Istanbul');
INSERT INTO championships VALUES (8, 1, 2014, 6, 'Doha');
INSERT INTO championships VALUES (9, 2, 1994, 4, 'Roma');
INSERT INTO championships VALUES (10, 2, 1998, 11, 'Perth');
INSERT INTO championships VALUES (11, 2, 2001, 15, 'Fukuoka');
INSERT INTO championships VALUES (12, 2, 2003, 12, 'Barcelona');
INSERT INTO championships VALUES (13, 2, 2005, 7, 'Montreal');
INSERT INTO championships VALUES (14, 2, 2007, 11, 'Melbourne');
INSERT INTO championships VALUES (15, 2, 2009, 4, 'Roma');
INSERT INTO championships VALUES (16, 2, 2011, 9, 'Shanghai');
INSERT INTO championships VALUES (17, 2, 2013, 12, 'Barcelona');
INSERT INTO championships VALUES (18, 2, 2015, 1, 'Kazan');
INSERT INTO championships VALUES (19, 2, 2017, 3, 'Budapest');
INSERT INTO championships VALUES (20, 3, 1992, 12, 'Barcelona');
INSERT INTO championships VALUES (21, 3, 1996, 2, 'Atlanta');
INSERT INTO championships VALUES (22, 3, 2000, 11, 'Sydney');
INSERT INTO championships VALUES (23, 3, 2004, 13, 'Athens');
INSERT INTO championships VALUES (24, 3, 2008, 9, 'Beijing');
INSERT INTO championships VALUES (25, 3, 2012, 10, 'London');
INSERT INTO championships VALUES (26, 3, 2016, 14, 'Rio_de_Janeiro');


--
-- Name: championships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('championships_id_seq', 26, true);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO countries VALUES (1, 'Russia');
INSERT INTO countries VALUES (2, 'USA');
INSERT INTO countries VALUES (3, 'Hungary');
INSERT INTO countries VALUES (4, 'Italy');
INSERT INTO countries VALUES (5, 'Turkey');
INSERT INTO countries VALUES (6, 'Qatar');
INSERT INTO countries VALUES (7, 'Canada');
INSERT INTO countries VALUES (8, 'UAE');
INSERT INTO countries VALUES (9, 'China');
INSERT INTO countries VALUES (10, 'Great_Britain');
INSERT INTO countries VALUES (11, 'Australia');
INSERT INTO countries VALUES (12, 'Spain');
INSERT INTO countries VALUES (13, 'Greece');
INSERT INTO countries VALUES (14, 'Brazil');
INSERT INTO countries VALUES (15, 'Japan');


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('countries_id_seq', 15, true);


--
-- Data for Name: styles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO styles VALUES (1, 'butterfly');
INSERT INTO styles VALUES (2, 'backstroke');
INSERT INTO styles VALUES (3, 'breaststroke');
INSERT INTO styles VALUES (4, 'freestyle');
INSERT INTO styles VALUES (5, 'individual medley');
INSERT INTO styles VALUES (6, 'relays');


--
-- Name: styles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('styles_id_seq', 9, true);


--
-- Data for Name: styles_swimmer_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO styles_swimmer_relations VALUES (1, 1, 1);
INSERT INTO styles_swimmer_relations VALUES (2, 1, 5);
INSERT INTO styles_swimmer_relations VALUES (3, 1, 11);
INSERT INTO styles_swimmer_relations VALUES (4, 2, 3);
INSERT INTO styles_swimmer_relations VALUES (5, 2, 5);
INSERT INTO styles_swimmer_relations VALUES (6, 2, 6);
INSERT INTO styles_swimmer_relations VALUES (7, 3, 8);
INSERT INTO styles_swimmer_relations VALUES (8, 4, 1);
INSERT INTO styles_swimmer_relations VALUES (9, 4, 2);
INSERT INTO styles_swimmer_relations VALUES (10, 4, 3);
INSERT INTO styles_swimmer_relations VALUES (11, 4, 4);
INSERT INTO styles_swimmer_relations VALUES (12, 4, 5);
INSERT INTO styles_swimmer_relations VALUES (13, 4, 6);
INSERT INTO styles_swimmer_relations VALUES (14, 4, 7);
INSERT INTO styles_swimmer_relations VALUES (15, 4, 9);
INSERT INTO styles_swimmer_relations VALUES (16, 4, 10);
INSERT INTO styles_swimmer_relations VALUES (17, 4, 11);
INSERT INTO styles_swimmer_relations VALUES (18, 5, 1);
INSERT INTO styles_swimmer_relations VALUES (19, 5, 3);
INSERT INTO styles_swimmer_relations VALUES (20, 5, 5);
INSERT INTO styles_swimmer_relations VALUES (21, 5, 6);
INSERT INTO styles_swimmer_relations VALUES (22, 6, 1);
INSERT INTO styles_swimmer_relations VALUES (23, 6, 2);
INSERT INTO styles_swimmer_relations VALUES (24, 6, 3);
INSERT INTO styles_swimmer_relations VALUES (25, 6, 4);
INSERT INTO styles_swimmer_relations VALUES (26, 6, 5);
INSERT INTO styles_swimmer_relations VALUES (27, 6, 6);
INSERT INTO styles_swimmer_relations VALUES (28, 6, 7);
INSERT INTO styles_swimmer_relations VALUES (29, 6, 8);
INSERT INTO styles_swimmer_relations VALUES (30, 6, 9);
INSERT INTO styles_swimmer_relations VALUES (31, 6, 10);
INSERT INTO styles_swimmer_relations VALUES (32, 6, 11);


--
-- Name: styles_swimmer_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('styles_swimmer_relations_id_seq', 32, true);


--
-- Data for Name: swimmer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO swimmer VALUES (1, 'Michael', 'Phelps', 'male', 2, '1985-06-30', 88, 193, 1, 23, 26, 37);
INSERT INTO swimmer VALUES (2, 'Alexander', 'Popov', 'male', 1, '1971-11-16', 87, 203, 4, 4, 6, 3);
INSERT INTO swimmer VALUES (3, 'Missy', 'Franklin', 'female', 2, '1995-05-10', 75, 185, 2, 4, 11, 4);
INSERT INTO swimmer VALUES (4, 'Katie', 'Ledecky', 'female', 2, '1997-03-17', 65, 178, 1, 5, 14, 13);
INSERT INTO swimmer VALUES (5, 'Cseh', 'Laszlo', 'male', 3, '1985-12-03', 82, 188, 5, 0, 2, 2);
INSERT INTO swimmer VALUES (6, 'Ryan', 'Lochte', 'male', 2, '1984-08-03', 86, 188, 5, 6, 39, 6);
INSERT INTO swimmer VALUES (7, 'Federica', 'Pellegrini', 'female', 4, '1988-08-05', 68, 177, 4, 1, 5, 2);
INSERT INTO swimmer VALUES (8, 'Yuliya', 'Yefimova', 'female', 1, '1992-04-03', 64, 178, 3, 0, 5, 2);
INSERT INTO swimmer VALUES (9, 'Ian', 'Thorpe', 'male', 11, '1982-10-13', 104, 196, 4, 5, 13, 13);
INSERT INTO swimmer VALUES (10, 'Yang', 'Sun', 'male', 9, '1991-12-01', 81, 198, 4, 3, 9, 2);
INSERT INTO swimmer VALUES (11, 'Cesar', 'Cielo', 'male', 14, '1987-01-10', 88, 195, 4, 1, 11, 3);


--
-- Data for Name: swimmer_championships_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO swimmer_championships_relations VALUES (1, 1, 3);
INSERT INTO swimmer_championships_relations VALUES (2, 1, 11);
INSERT INTO swimmer_championships_relations VALUES (3, 1, 12);
INSERT INTO swimmer_championships_relations VALUES (4, 1, 13);
INSERT INTO swimmer_championships_relations VALUES (5, 1, 14);
INSERT INTO swimmer_championships_relations VALUES (6, 1, 15);
INSERT INTO swimmer_championships_relations VALUES (7, 1, 16);
INSERT INTO swimmer_championships_relations VALUES (8, 1, 22);
INSERT INTO swimmer_championships_relations VALUES (9, 1, 23);
INSERT INTO swimmer_championships_relations VALUES (10, 1, 24);
INSERT INTO swimmer_championships_relations VALUES (11, 1, 25);
INSERT INTO swimmer_championships_relations VALUES (12, 1, 26);
INSERT INTO swimmer_championships_relations VALUES (13, 2, 2);
INSERT INTO swimmer_championships_relations VALUES (14, 2, 9);
INSERT INTO swimmer_championships_relations VALUES (15, 2, 10);
INSERT INTO swimmer_championships_relations VALUES (16, 2, 12);
INSERT INTO swimmer_championships_relations VALUES (17, 2, 20);
INSERT INTO swimmer_championships_relations VALUES (18, 2, 21);
INSERT INTO swimmer_championships_relations VALUES (19, 2, 22);
INSERT INTO swimmer_championships_relations VALUES (20, 3, 6);
INSERT INTO swimmer_championships_relations VALUES (21, 3, 16);
INSERT INTO swimmer_championships_relations VALUES (22, 3, 17);
INSERT INTO swimmer_championships_relations VALUES (23, 3, 18);
INSERT INTO swimmer_championships_relations VALUES (24, 3, 25);
INSERT INTO swimmer_championships_relations VALUES (25, 3, 26);
INSERT INTO swimmer_championships_relations VALUES (26, 4, 17);
INSERT INTO swimmer_championships_relations VALUES (27, 4, 18);
INSERT INTO swimmer_championships_relations VALUES (28, 4, 19);
INSERT INTO swimmer_championships_relations VALUES (29, 4, 25);
INSERT INTO swimmer_championships_relations VALUES (30, 4, 26);
INSERT INTO swimmer_championships_relations VALUES (31, 5, 6);
INSERT INTO swimmer_championships_relations VALUES (32, 5, 7);
INSERT INTO swimmer_championships_relations VALUES (33, 5, 12);
INSERT INTO swimmer_championships_relations VALUES (34, 5, 13);
INSERT INTO swimmer_championships_relations VALUES (35, 5, 14);
INSERT INTO swimmer_championships_relations VALUES (36, 5, 15);
INSERT INTO swimmer_championships_relations VALUES (37, 5, 16);
INSERT INTO swimmer_championships_relations VALUES (38, 5, 17);
INSERT INTO swimmer_championships_relations VALUES (39, 5, 18);
INSERT INTO swimmer_championships_relations VALUES (40, 5, 19);
INSERT INTO swimmer_championships_relations VALUES (41, 5, 23);
INSERT INTO swimmer_championships_relations VALUES (42, 5, 24);
INSERT INTO swimmer_championships_relations VALUES (43, 5, 25);
INSERT INTO swimmer_championships_relations VALUES (44, 5, 26);
INSERT INTO swimmer_championships_relations VALUES (45, 6, 3);
INSERT INTO swimmer_championships_relations VALUES (46, 6, 4);
INSERT INTO swimmer_championships_relations VALUES (47, 6, 5);
INSERT INTO swimmer_championships_relations VALUES (48, 6, 6);
INSERT INTO swimmer_championships_relations VALUES (49, 6, 7);
INSERT INTO swimmer_championships_relations VALUES (50, 6, 8);
INSERT INTO swimmer_championships_relations VALUES (51, 6, 13);
INSERT INTO swimmer_championships_relations VALUES (52, 6, 14);
INSERT INTO swimmer_championships_relations VALUES (53, 6, 15);
INSERT INTO swimmer_championships_relations VALUES (54, 6, 16);
INSERT INTO swimmer_championships_relations VALUES (55, 6, 17);
INSERT INTO swimmer_championships_relations VALUES (56, 6, 18);
INSERT INTO swimmer_championships_relations VALUES (57, 6, 23);
INSERT INTO swimmer_championships_relations VALUES (58, 6, 24);
INSERT INTO swimmer_championships_relations VALUES (59, 6, 25);
INSERT INTO swimmer_championships_relations VALUES (60, 6, 26);
INSERT INTO swimmer_championships_relations VALUES (61, 7, 4);
INSERT INTO swimmer_championships_relations VALUES (62, 7, 6);
INSERT INTO swimmer_championships_relations VALUES (63, 7, 13);
INSERT INTO swimmer_championships_relations VALUES (64, 7, 14);
INSERT INTO swimmer_championships_relations VALUES (65, 7, 15);
INSERT INTO swimmer_championships_relations VALUES (66, 7, 16);
INSERT INTO swimmer_championships_relations VALUES (67, 7, 17);
INSERT INTO swimmer_championships_relations VALUES (68, 7, 18);
INSERT INTO swimmer_championships_relations VALUES (69, 7, 19);
INSERT INTO swimmer_championships_relations VALUES (70, 7, 23);
INSERT INTO swimmer_championships_relations VALUES (71, 7, 24);
INSERT INTO swimmer_championships_relations VALUES (72, 7, 25);
INSERT INTO swimmer_championships_relations VALUES (73, 7, 26);
INSERT INTO swimmer_championships_relations VALUES (74, 8, 5);
INSERT INTO swimmer_championships_relations VALUES (75, 8, 15);
INSERT INTO swimmer_championships_relations VALUES (76, 8, 16);
INSERT INTO swimmer_championships_relations VALUES (77, 8, 17);
INSERT INTO swimmer_championships_relations VALUES (78, 8, 18);
INSERT INTO swimmer_championships_relations VALUES (79, 8, 19);
INSERT INTO swimmer_championships_relations VALUES (80, 8, 24);
INSERT INTO swimmer_championships_relations VALUES (81, 8, 25);
INSERT INTO swimmer_championships_relations VALUES (82, 8, 26);
INSERT INTO swimmer_championships_relations VALUES (83, 9, 1);
INSERT INTO swimmer_championships_relations VALUES (84, 9, 10);
INSERT INTO swimmer_championships_relations VALUES (85, 9, 11);
INSERT INTO swimmer_championships_relations VALUES (86, 9, 12);
INSERT INTO swimmer_championships_relations VALUES (87, 9, 22);
INSERT INTO swimmer_championships_relations VALUES (88, 9, 23);
INSERT INTO swimmer_championships_relations VALUES (89, 10, 15);
INSERT INTO swimmer_championships_relations VALUES (90, 10, 16);
INSERT INTO swimmer_championships_relations VALUES (91, 10, 17);
INSERT INTO swimmer_championships_relations VALUES (92, 10, 18);
INSERT INTO swimmer_championships_relations VALUES (93, 10, 19);
INSERT INTO swimmer_championships_relations VALUES (94, 10, 25);
INSERT INTO swimmer_championships_relations VALUES (95, 10, 26);
INSERT INTO swimmer_championships_relations VALUES (96, 11, 3);
INSERT INTO swimmer_championships_relations VALUES (97, 11, 6);
INSERT INTO swimmer_championships_relations VALUES (98, 11, 8);
INSERT INTO swimmer_championships_relations VALUES (99, 11, 4);
INSERT INTO swimmer_championships_relations VALUES (100, 11, 14);
INSERT INTO swimmer_championships_relations VALUES (101, 11, 15);
INSERT INTO swimmer_championships_relations VALUES (102, 11, 16);
INSERT INTO swimmer_championships_relations VALUES (103, 11, 17);
INSERT INTO swimmer_championships_relations VALUES (104, 11, 18);
INSERT INTO swimmer_championships_relations VALUES (105, 11, 19);


--
-- Name: swimmer_championships_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('swimmer_championships_relations_id_seq', 105, true);


--
-- Name: swimmer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('swimmer_id_seq', 11, true);


--
-- Data for Name: type_of_championship; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO type_of_championship VALUES (1, 'world_championships(25m)');
INSERT INTO type_of_championship VALUES (2, 'world_championships(50m)');
INSERT INTO type_of_championship VALUES (3, 'olympic_games');


--
-- Name: type_of_championship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('type_of_championship_id_seq', 3, true);


--
-- Name: championships championships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY championships
    ADD CONSTRAINT championships_pkey PRIMARY KEY (id);


--
-- Name: countries countries_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_name_key UNIQUE (name);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: styles styles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY styles
    ADD CONSTRAINT styles_name_key UNIQUE (name);


--
-- Name: styles styles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY styles
    ADD CONSTRAINT styles_pkey PRIMARY KEY (id);


--
-- Name: styles_swimmer_relations styles_swimmer_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY styles_swimmer_relations
    ADD CONSTRAINT styles_swimmer_relations_pkey PRIMARY KEY (id);


--
-- Name: swimmer_championships_relations swimmer_championships_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY swimmer_championships_relations
    ADD CONSTRAINT swimmer_championships_relations_pkey PRIMARY KEY (id);


--
-- Name: swimmer swimmer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY swimmer
    ADD CONSTRAINT swimmer_pkey PRIMARY KEY (id);


--
-- Name: type_of_championship type_of_championship_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY type_of_championship
    ADD CONSTRAINT type_of_championship_pkey PRIMARY KEY (id);


--
-- Name: championships championships_id_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY championships
    ADD CONSTRAINT championships_id_country_fkey FOREIGN KEY (id_country) REFERENCES countries(id);


--
-- Name: championships championships_id_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY championships
    ADD CONSTRAINT championships_id_type_fkey FOREIGN KEY (id_type) REFERENCES type_of_championship(id);


--
-- Name: styles_swimmer_relations styles_swimmer_relations_id_styles_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY styles_swimmer_relations
    ADD CONSTRAINT styles_swimmer_relations_id_styles_fkey FOREIGN KEY (id_styles) REFERENCES styles(id);


--
-- Name: styles_swimmer_relations styles_swimmer_relations_id_swimmer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY styles_swimmer_relations
    ADD CONSTRAINT styles_swimmer_relations_id_swimmer_fkey FOREIGN KEY (id_swimmer) REFERENCES swimmer(id);


--
-- Name: swimmer_championships_relations swimmer_championships_relations_id_championship_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY swimmer_championships_relations
    ADD CONSTRAINT swimmer_championships_relations_id_championship_fkey FOREIGN KEY (id_championship) REFERENCES championships(id);


--
-- Name: swimmer_championships_relations swimmer_championships_relations_id_swimmer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY swimmer_championships_relations
    ADD CONSTRAINT swimmer_championships_relations_id_swimmer_fkey FOREIGN KEY (id_swimmer) REFERENCES swimmer(id);


--
-- Name: swimmer swimmer_id_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY swimmer
    ADD CONSTRAINT swimmer_id_country_fkey FOREIGN KEY (id_country) REFERENCES countries(id);


--
-- Name: swimmer swimmer_main_style_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY swimmer
    ADD CONSTRAINT swimmer_main_style_id_fkey FOREIGN KEY (main_style_id) REFERENCES styles(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

