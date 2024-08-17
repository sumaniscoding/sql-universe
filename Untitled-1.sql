--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cluster (
    cluster_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.cluster OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    cluster_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    description text,
    distance_from_earth integer,
    age_in_million_years numeric(13,1),
    mass integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass integer,
    dist_from_planet integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    planet_type text,
    has_water boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_million_years numeric(13,1),
    distance_from_earth integer,
    mass integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cluster VALUES (1, 'cluster a', 'first cluster');
INSERT INTO public.cluster VALUES (2, 'cluster b', 'second cluster');
INSERT INTO public.cluster VALUES (3, 'cluster c', 'third cluster');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 1, 'galaxy a', NULL, NULL, NULL, NULL, 54);
INSERT INTO public.galaxy VALUES (2, 1, 'galaxy b', NULL, NULL, NULL, NULL, 66);
INSERT INTO public.galaxy VALUES (3, 2, 'galaxy c', NULL, NULL, NULL, NULL, 87);
INSERT INTO public.galaxy VALUES (4, 2, 'galaxy d', NULL, NULL, NULL, NULL, 89);
INSERT INTO public.galaxy VALUES (5, 3, 'galaxy e', NULL, NULL, NULL, NULL, 77);
INSERT INTO public.galaxy VALUES (6, 3, 'galaxy f', NULL, NULL, NULL, NULL, 109);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'moon1', NULL, NULL);
INSERT INTO public.moon VALUES (2, 1, 'moon2', NULL, NULL);
INSERT INTO public.moon VALUES (3, 2, 'moon3', NULL, NULL);
INSERT INTO public.moon VALUES (4, 2, 'moon4', NULL, NULL);
INSERT INTO public.moon VALUES (5, 3, 'moon5', NULL, NULL);
INSERT INTO public.moon VALUES (6, 3, 'moon6', NULL, NULL);
INSERT INTO public.moon VALUES (7, 4, 'moon7', NULL, NULL);
INSERT INTO public.moon VALUES (8, 4, 'moon8', NULL, NULL);
INSERT INTO public.moon VALUES (9, 5, 'moon9', NULL, NULL);
INSERT INTO public.moon VALUES (10, 5, 'moon10', NULL, NULL);
INSERT INTO public.moon VALUES (11, 5, 'moon11', NULL, NULL);
INSERT INTO public.moon VALUES (12, 5, 'moon12', NULL, NULL);
INSERT INTO public.moon VALUES (14, 6, 'moon14', NULL, NULL);
INSERT INTO public.moon VALUES (13, 6, 'moon13', NULL, NULL);
INSERT INTO public.moon VALUES (16, 7, 'moon16', NULL, NULL);
INSERT INTO public.moon VALUES (15, 7, 'moon15', NULL, NULL);
INSERT INTO public.moon VALUES (18, 8, 'moon18', NULL, NULL);
INSERT INTO public.moon VALUES (17, 8, 'moon17', NULL, NULL);
INSERT INTO public.moon VALUES (20, 9, 'moon20', NULL, NULL);
INSERT INTO public.moon VALUES (19, 9, 'moon19', NULL, NULL);
INSERT INTO public.moon VALUES (22, 10, 'moon22', NULL, NULL);
INSERT INTO public.moon VALUES (21, 10, 'moon21', NULL, NULL);
INSERT INTO public.moon VALUES (24, 11, 'moon24', NULL, NULL);
INSERT INTO public.moon VALUES (23, 11, 'moon23', NULL, NULL);
INSERT INTO public.moon VALUES (26, 12, 'moon26', NULL, NULL);
INSERT INTO public.moon VALUES (25, 12, 'moon25', NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'planet a', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (2, 2, 'planet b', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (3, 3, 'planet c', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (4, 4, 'planet d', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (5, 5, 'planet e', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 6, 'planet f', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 7, 'planet g', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 8, 'planet g', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 9, 'planet h', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 10, 'planet i', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 11, 'planet j', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 12, 'planet k', NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'star a', NULL, NULL, 12);
INSERT INTO public.star VALUES (2, 1, 'star b', NULL, NULL, 23);
INSERT INTO public.star VALUES (3, 2, 'star c', NULL, NULL, 34);
INSERT INTO public.star VALUES (4, 2, 'star d', NULL, NULL, 45);
INSERT INTO public.star VALUES (5, 3, 'star e', NULL, NULL, 56);
INSERT INTO public.star VALUES (6, 3, 'star f', NULL, NULL, 67);
INSERT INTO public.star VALUES (7, 4, 'star g', NULL, NULL, 78);
INSERT INTO public.star VALUES (8, 4, 'star h', NULL, NULL, 89);
INSERT INTO public.star VALUES (9, 5, 'star i', NULL, NULL, 90);
INSERT INTO public.star VALUES (10, 5, 'star j', NULL, NULL, 100);
INSERT INTO public.star VALUES (11, 6, 'star k', NULL, NULL, 102);
INSERT INTO public.star VALUES (12, 6, 'star l', NULL, NULL, 54);


--
-- Name: cluster cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_pkey PRIMARY KEY (cluster_id);


--
-- Name: cluster cluster_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_unq UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unq_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unq_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unq_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unq_id_key UNIQUE (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_key UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unq_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unq_name UNIQUE (name);


--
-- Name: galaxy galaxy_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(cluster_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

