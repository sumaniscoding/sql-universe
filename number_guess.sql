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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    trys integer NOT NULL,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 7, 7);
INSERT INTO public.games VALUES (2, 3, 7);
INSERT INTO public.games VALUES (3, 771, 8);
INSERT INTO public.games VALUES (4, 194, 8);
INSERT INTO public.games VALUES (5, 554, 9);
INSERT INTO public.games VALUES (6, 803, 9);
INSERT INTO public.games VALUES (7, 505, 8);
INSERT INTO public.games VALUES (8, 891, 8);
INSERT INTO public.games VALUES (9, 71, 8);
INSERT INTO public.games VALUES (10, 794, 10);
INSERT INTO public.games VALUES (11, 897, 10);
INSERT INTO public.games VALUES (12, 211, 11);
INSERT INTO public.games VALUES (13, 486, 11);
INSERT INTO public.games VALUES (14, 519, 10);
INSERT INTO public.games VALUES (15, 956, 10);
INSERT INTO public.games VALUES (16, 409, 10);
INSERT INTO public.games VALUES (17, 4, 12);
INSERT INTO public.games VALUES (18, 7, 12);
INSERT INTO public.games VALUES (19, 557, 13);
INSERT INTO public.games VALUES (20, 911, 13);
INSERT INTO public.games VALUES (21, 582, 12);
INSERT INTO public.games VALUES (22, 328, 12);
INSERT INTO public.games VALUES (23, 537, 12);
INSERT INTO public.games VALUES (24, 3, 14);
INSERT INTO public.games VALUES (25, 855, 15);
INSERT INTO public.games VALUES (26, 377, 15);
INSERT INTO public.games VALUES (27, 55, 16);
INSERT INTO public.games VALUES (28, 248, 16);
INSERT INTO public.games VALUES (29, 494, 15);
INSERT INTO public.games VALUES (30, 555, 15);
INSERT INTO public.games VALUES (31, 942, 15);
INSERT INTO public.games VALUES (32, 493, 17);
INSERT INTO public.games VALUES (33, 119, 17);
INSERT INTO public.games VALUES (34, 391, 18);
INSERT INTO public.games VALUES (35, 555, 18);
INSERT INTO public.games VALUES (36, 239, 17);
INSERT INTO public.games VALUES (37, 672, 17);
INSERT INTO public.games VALUES (38, 198, 17);
INSERT INTO public.games VALUES (39, 691, 19);
INSERT INTO public.games VALUES (40, 630, 19);
INSERT INTO public.games VALUES (41, 697, 20);
INSERT INTO public.games VALUES (42, 848, 20);
INSERT INTO public.games VALUES (43, 404, 19);
INSERT INTO public.games VALUES (44, 35, 19);
INSERT INTO public.games VALUES (45, 75, 19);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (7, 'tony');
INSERT INTO public.users VALUES (8, 'user_1725080234955');
INSERT INTO public.users VALUES (9, 'user_1725080234954');
INSERT INTO public.users VALUES (10, 'user_1725080307808');
INSERT INTO public.users VALUES (11, 'user_1725080307807');
INSERT INTO public.users VALUES (12, 'user_1725080595053');
INSERT INTO public.users VALUES (13, 'user_1725080595052');
INSERT INTO public.users VALUES (14, 'test');
INSERT INTO public.users VALUES (15, 'user_1725081038977');
INSERT INTO public.users VALUES (16, 'user_1725081038976');
INSERT INTO public.users VALUES (17, 'user_1725081083463');
INSERT INTO public.users VALUES (18, 'user_1725081083462');
INSERT INTO public.users VALUES (19, 'user_1725081165898');
INSERT INTO public.users VALUES (20, 'user_1725081165897');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 45, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 20, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

