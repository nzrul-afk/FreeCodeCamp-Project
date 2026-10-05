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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size_km numeric NOT NULL,
    is_spherical boolean,
    description text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    has_life boolean,
    distance_from_earth numeric,
    age_in_millions_of_years integer
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    has_life boolean,
    diameter_km numeric,
    description text,
    age_in_millions_of_years integer
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean,
    is_spherical boolean,
    distance_from_star numeric,
    moons_count integer
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(50),
    is_spherical boolean,
    age_in_millions_of_years integer,
    description text
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 940, true, 'Objek terbesar di sabuk asteroid');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, false, 'Salah satu asteroid terbesar di tata surya');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 512, false, 'Asteroid terbesar ketiga di tata surya');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', true, 0, 13600);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', false, 2500000, 10000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', false, 3000000, 11000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', false, 23000000, 12000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', false, 29000000, 13000);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Lenticular', false, 500000000, 9000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, false, 3474, 'Satelit alami Bumi', 4500);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 22.2, 'Bulan terbesar Mars', 4000);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 12.4, 'Bulan terkecil Mars', 4000);
INSERT INTO public.moon VALUES (4, 'Io', 5, false, 3643, 'Bulan Jupiter dengan gunung berapi aktif', 4500);
INSERT INTO public.moon VALUES (5, 'Europa', 5, false, 3122, 'Bulan Jupiter dengan lautan bawah es', 4500);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, false, 5268, 'Bulan terbesar di tata surya', 4500);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, false, 4821, 'Bulan Jupiter dengan permukaan penuh kawah', 4500);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, false, 250, 'Bulan kecil Jupiter berbentuk tidak beraturan', 4000);
INSERT INTO public.moon VALUES (9, 'Titan', 6, false, 5150, 'Bulan Saturnus dengan atmosfer tebal', 4500);
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, false, 504, 'Bulan Saturnus dengan geyser es', 4500);
INSERT INTO public.moon VALUES (11, 'Mimas', 6, false, 396, 'Bulan Saturnus mirip Death Star', 4500);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, false, 1527, 'Bulan terbesar kedua Saturnus', 4500);
INSERT INTO public.moon VALUES (13, 'Iapetus', 6, false, 1469, 'Bulan Saturnus dengan dua warna permukaan', 4500);
INSERT INTO public.moon VALUES (14, 'Dione', 6, false, 1123, 'Bulan Saturnus dengan permukaan bercahaya', 4500);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, false, 471, 'Bulan Uranus dengan permukaan ekstrem', 4000);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, false, 1158, 'Bulan Uranus paling terang', 4000);
INSERT INTO public.moon VALUES (17, 'Triton', 8, false, 2707, 'Bulan Neptunus dengan orbit terbalik', 4000);
INSERT INTO public.moon VALUES (18, 'Nereid', 8, false, 340, 'Bulan Neptunus dengan orbit sangat elips', 4000);
INSERT INTO public.moon VALUES (19, 'Sirius Moon A', 9, false, 500, 'Bulan fiksi di sistem Sirius', 3000);
INSERT INTO public.moon VALUES (20, 'Proxima Moon A', 12, false, 200, 'Bulan fiksi di sistem Proxima', 3000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, true, 57.9, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, true, 108.2, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, true, 149.6, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, true, 227.9, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, true, 778.3, 5);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, true, 1427, 6);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, true, 2871, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, true, 4497, 2);
INSERT INTO public.planet VALUES (9, 'Sirius Prime', 2, false, true, 100, 1);
INSERT INTO public.planet VALUES (10, 'Sirius Minor', 2, false, true, 150, 0);
INSERT INTO public.planet VALUES (11, 'Proxima b', 4, false, true, 7.5, 0);
INSERT INTO public.planet VALUES (12, 'Proxima c', 4, false, true, 15, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', true, 4600, 'Bintang pusat tata surya kita');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-type', true, 242, 'Bintang paling terang di langit malam');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red Supergiant', true, 10, 'Bintang raksasa merah mendekati akhir hidupnya');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'Red Dwarf', true, 4850, 'Bintang terdekat dari Matahari');
INSERT INTO public.star VALUES (5, 'Alpheratz', 2, 'B-type', true, 60, 'Bintang paling terang di area Andromeda');
INSERT INTO public.star VALUES (6, 'Mirach', 2, 'Red Giant', true, 500, 'Bintang raksasa merah di Andromeda');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

