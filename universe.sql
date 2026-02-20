--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean DEFAULT false NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    spiral_arms integer,
    is_active boolean DEFAULT false NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    distance_from_planet integer,
    diameter_in_km integer,
    has_life boolean DEFAULT false NOT NULL,
    age_in_millions_of_years numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    distance_from_sun integer,
    diameter_in_km integer,
    has_life boolean DEFAULT false NOT NULL,
    age_in_millions_of_years numeric,
    planet_type text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    is_visible boolean DEFAULT true NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Large spiral galaxy', true, true);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Our home galaxy', true, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral galaxy', false, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Galaxy with prominent dust lane', false, true);
INSERT INTO public.galaxy VALUES (5, 'Cartwheel', 'Lenticular galaxy', false, false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Grand design spiral galaxy', false, true);
INSERT INTO public.galaxy VALUES (7, 'Centaurus A', 'Giant elliptical galaxy', false, true);
INSERT INTO public.galaxy VALUES (8, 'Black Eye', 'Spiral galaxy with dark dust band', false, false);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'Spiral shaped galaxy with rotating disk', 2, true);
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'Elliptical shaped galaxy', 0, false);
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'Irregular shaped galaxy', 0, false);
INSERT INTO public.galaxy_type VALUES (4, 'Lenticular', 'Disk galaxy without spiral arms', 0, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 384, 3474, false, 4500);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 9, 22, false, 4500);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 23, 12, false, 4500);
INSERT INTO public.moon VALUES (4, 'Io', 5, 422, 3643, false, 4500);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 671, 3122, false, 4500);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 1070, 5268, false, 4500);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 1883, 4821, false, 4500);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 186, 396, false, 4500);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 238, 504, false, 4500);
INSERT INTO public.moon VALUES (10, 'Titan', 6, 1222, 5150, false, 4500);
INSERT INTO public.moon VALUES (11, 'Iapetus', 6, 3561, 1469, false, 4500);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 527, 1527, false, 4500);
INSERT INTO public.moon VALUES (13, 'Dione', 6, 377, 1123, false, 4500);
INSERT INTO public.moon VALUES (14, 'Tethys', 6, 295, 1062, false, 4500);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 191, 1158, false, 4500);
INSERT INTO public.moon VALUES (16, 'Umbriel', 7, 266, 1169, false, 4500);
INSERT INTO public.moon VALUES (17, 'Titania', 7, 436, 1578, false, 4500);
INSERT INTO public.moon VALUES (18, 'Oberon', 7, 584, 1523, false, 4500);
INSERT INTO public.moon VALUES (19, 'Triton', 8, 355, 2707, false, 4500);
INSERT INTO public.moon VALUES (20, 'Proteus', 8, 118, 210, false, 4500);
INSERT INTO public.moon VALUES (21, 'Proxima b Moon 1', 9, 50, 800, false, 4500);
INSERT INTO public.moon VALUES (22, 'Proxima b Moon 2', 9, 120, 1200, false, 4500);
INSERT INTO public.moon VALUES (23, 'Proxima b Moon 3', 9, 200, 1500, false, 4500);
INSERT INTO public.moon VALUES (24, 'Betelgeuse I Moon 1', 10, 100, 2000, false, 3000);
INSERT INTO public.moon VALUES (25, 'Betelgeuse I Moon 2', 10, 250, 3000, false, 3000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 58, 4879, false, 4600, 'Terrestrial');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 108, 12104, false, 4600, 'Terrestrial');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 150, 12742, true, 4600, 'Terrestrial');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 228, 6779, false, 4600, 'Terrestrial');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 778, 139820, false, 4600, 'Gas Giant');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 1427, 116460, false, 4600, 'Gas Giant');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 2871, 50724, false, 4600, 'Ice Giant');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 4495, 49244, false, 4600, 'Ice Giant');
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 4, 7, 7000, true, 4500, 'Terrestrial');
INSERT INTO public.planet VALUES (10, 'Betelgeuse I', 2, 100, 25000, false, 3000, 'Super-Earth');
INSERT INTO public.planet VALUES (11, 'Vega I', 3, 60, 9000, false, 2500, 'Terrestrial');
INSERT INTO public.planet VALUES (12, 'Vega II', 3, 120, 15000, false, 2500, 'Terrestrial');
INSERT INTO public.planet VALUES (13, 'Andromeda Planet 1', 5, 80, 11000, false, 2000, 'Terrestrial');
INSERT INTO public.planet VALUES (14, 'Andromeda Planet 2', 5, 130, 18000, false, 2000, 'Gas Giant');
INSERT INTO public.planet VALUES (15, 'Andromeda Planet 3', 6, 90, 12000, false, 1800, 'Terrestrial');
INSERT INTO public.planet VALUES (16, 'Triangulum Planet 1', 7, 75, 10000, false, 1500, 'Terrestrial');
INSERT INTO public.planet VALUES (17, 'Sombrero Planet 1', 8, 95, 13000, false, 5000, 'Terrestrial');
INSERT INTO public.planet VALUES (18, 'Cartwheel Planet 1', 9, 85, 11500, false, 300, 'Terrestrial');
INSERT INTO public.planet VALUES (19, 'Whirlpool Planet 1', 10, 110, 16000, false, 1500, 'Gas Giant');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 2, 300, 8.6, true);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 2, 900, 640, true);
INSERT INTO public.star VALUES (3, 'Vega', 2, 400, 25.04, true);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 2, 5000, 4.24, false);
INSERT INTO public.star VALUES (5, 'Andromeda A', 1, 2000, 2537000, false);
INSERT INTO public.star VALUES (6, 'Andromeda B', 1, 1800, 2537000, false);
INSERT INTO public.star VALUES (7, 'Triangulum A', 3, 1500, 3000000, false);
INSERT INTO public.star VALUES (8, 'Sombrero A', 4, 10000, 29300000, false);
INSERT INTO public.star VALUES (9, 'Cartwheel A', 5, 600, 150000000, false);
INSERT INTO public.star VALUES (10, 'Whirlpool A', 6, 3000, 23000000, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 19, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

