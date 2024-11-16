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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    star_id integer,
    planet_id integer,
    name character varying(100) NOT NULL,
    discovered_by character varying(100) NOT NULL,
    discovery_date date,
    mass_kg double precision
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteriod_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteriod_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteriod_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteriod_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteriod_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100),
    type character varying(50),
    distance_light_years double precision,
    num_stars integer NOT NULL,
    discovery_by character varying(100) NOT NULL,
    discovery_date date
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
    planet_id integer,
    name character varying(100) NOT NULL,
    radius_km integer NOT NULL,
    orbital_period_days integer,
    has_atmosphere boolean,
    discovery_date date
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
    star_id integer,
    name character varying(100) NOT NULL,
    type character varying(50),
    mass_earth double precision,
    radius_km numeric(10,3),
    has_life boolean,
    discovery_date date,
    distance_star_au double precision NOT NULL,
    super_heros text
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
    galaxy_id integer,
    name character varying(150) NOT NULL,
    type character varying(50),
    mass_solar double precision,
    radius_km double precision NOT NULL,
    temperature_k integer
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

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteriod_asteroid_id_seq'::regclass);


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

INSERT INTO public.asteroid VALUES (9, 5, 26, 'Ceres', 'Giusepe Piazzi', '1801-01-01', 9.39);
INSERT INTO public.asteroid VALUES (10, 1, 17, 'Pallas', 'Heinrich Olbers', '1802-03-28', 2.11);
INSERT INTO public.asteroid VALUES (11, 2, 18, 'Juno', 'Karl Harding', '1804-09-01', 2.67);
INSERT INTO public.asteroid VALUES (12, 3, 17, 'Vesta', 'Heinrich Olbers', '1807-03-29', 2.59);
INSERT INTO public.asteroid VALUES (13, 4, 20, 'Eros', 'Gustav Witt', '1898-09-13', 6.69);
INSERT INTO public.asteroid VALUES (14, 5, 24, 'Iris', 'John Russel', '1847-08-13', 1.2);
INSERT INTO public.asteroid VALUES (15, 6, 18, 'Psyche', 'Annibale de Gasparis', '1852-03-17', 2.73);
INSERT INTO public.asteroid VALUES (16, 3, 29, 'Hygeia', 'Annibale de Gasparis', '1849-04-12', 8.32);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral', 2.537, 1000000000, 'Hubble', '1785-06-05');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Spiral', 0, 2000000000, 'Ancient Astronomers', '1785-01-01');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3, 400000000, 'Hubble', '1900-01-01');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23.2, 300000000, 'Vesto Melvin Slipher', '1900-02-25');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 28.9, 800000000, 'Ernest Öpik', '1930-04-10');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 21.7, 50000000, 'Hubble', '1940-07-16');
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 'Elliptical', 53.5, 2000000000, 'Theodor Von Oppolzer', '1781-04-12');
INSERT INTO public.galaxy VALUES (8, 'Centaurus A', 'Elliptical', 12.5, 1000000000, 'James Dunlop', '1826-05-29');
INSERT INTO public.galaxy VALUES (9, 'NGC253', 'Spiral', 10.3, 600000000, 'John Herschel', '1826-10-09');
INSERT INTO public.galaxy VALUES (10, 'Black Eye', 'Spiral', 17, 200000000, 'William Herschel', '1785-03-16');
INSERT INTO public.galaxy VALUES (11, 'Tadpole', 'Irregular', 420, 1000000000, 'Hubble', '1990-06-19');
INSERT INTO public.galaxy VALUES (12, 'Bode Galaxy', 'Spiral', 11.6, 800000000, 'Johann Bode', '1774-12-31');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 17, 'Europa', 1560, 4, true, '1610-01-08');
INSERT INTO public.moon VALUES (22, 22, 'Ganymede', 2634, 7, true, '1610-01-07');
INSERT INTO public.moon VALUES (23, 23, 'Callisto', 2410, 17, false, '1610-01-09');
INSERT INTO public.moon VALUES (24, 24, 'lo', 1821, 2, true, '1610-01-07');
INSERT INTO public.moon VALUES (25, 25, 'Titan', 2575, 16, true, '1655-03-25');
INSERT INTO public.moon VALUES (26, 26, 'Enceladus', 252, 1, true, '1789-08-28');
INSERT INTO public.moon VALUES (27, 27, 'Triton', 1353, 6, true, '1846-10-10');
INSERT INTO public.moon VALUES (28, 28, 'Charon', 606, 6, false, '1978-06-22');
INSERT INTO public.moon VALUES (29, 28, 'Deimos', 6, 1, false, '1877-08-18');
INSERT INTO public.moon VALUES (30, 29, 'Phobos', 11, 0, false, '1877-08-12');
INSERT INTO public.moon VALUES (31, 20, 'Mimas', 199, 1, false, '1789-09-17');
INSERT INTO public.moon VALUES (32, 21, 'Rhea', 764, 5, true, '1672-12-23');
INSERT INTO public.moon VALUES (33, 21, 'Lapetus', 735, 79, false, '1671-10-25');
INSERT INTO public.moon VALUES (34, 24, 'Dione', 561, 3, true, '1684-03-21');
INSERT INTO public.moon VALUES (35, 23, 'Tethys', 531, 2, false, '1684-03-21');
INSERT INTO public.moon VALUES (36, 26, 'Miranda', 235, 1, true, '1948-02-16');
INSERT INTO public.moon VALUES (37, 24, 'Ariel', 578, 3, true, '1851-10-24');
INSERT INTO public.moon VALUES (38, 22, 'Umbriel', 584, 4, false, '1851-10-24');
INSERT INTO public.moon VALUES (39, 25, 'Oberon', 761, 14, false, '1787-01-11');
INSERT INTO public.moon VALUES (40, 23, 'Hyperion', 133, 21, false, '1848-09-16');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (17, 1, 'Earth', 'Terrestrial', 1, 6371.000, true, '2000-01-01', 1, 'Superma, Wonderwoman');
INSERT INTO public.planet VALUES (18, 2, 'Mars', 'Terrestrial', 0.107, 3389.000, false, '1659-12-06', 1.52, 'Green Lantern');
INSERT INTO public.planet VALUES (19, 3, 'Venus', 'Terrestrial', 0.815, 6051.800, false, '1610-01-01', 0.72, NULL);
INSERT INTO public.planet VALUES (20, 4, 'Jupiter', 'Gas Giant', 317.8, 69911.000, false, '1610-01-07', 5.2, 'Thor');
INSERT INTO public.planet VALUES (21, 5, 'Saturn', 'Gas Giant', 95.2, 58232.000, false, '1610-01-01', 9.58, NULL);
INSERT INTO public.planet VALUES (22, 6, 'Uranus', 'Ice Giant', 14.5, 25362.000, false, '1781-03-13', 19.18, NULL);
INSERT INTO public.planet VALUES (23, 7, 'Neptune', 'Ice Giant', 17.1, 24622.000, false, '1846-09-23', 30.07, 'Aquaman');
INSERT INTO public.planet VALUES (24, 8, 'Titan', 'Moon', 0.0225, 2575.500, false, '1655-03-25', 1.2, NULL);
INSERT INTO public.planet VALUES (25, 9, 'Europa', 'Titan', 0.008, 1560.800, true, '1610-01-08', 0.41, NULL);
INSERT INTO public.planet VALUES (26, 9, 'Mars II', 'Terrestrial', 0.2, 4000.000, false, '2025-05-14', 1.8, NULL);
INSERT INTO public.planet VALUES (27, 8, 'Kepler-22b', 'Exoplanet', 2.4, 5900.000, true, '2011-12-05', 620, NULL);
INSERT INTO public.planet VALUES (28, 7, 'Glise 581g', 'Exoplanet', 3.1, 5000.000, false, '2007-04-24', 20.3, NULL);
INSERT INTO public.planet VALUES (29, 6, 'Proxima b', 'Exoplanet', 1.3, 6000.000, false, '2016-08-24', 4.24, NULL);
INSERT INTO public.planet VALUES (30, 5, 'Pandora', 'Exoplanet', 4.5, 7845.014, true, '1445-02-14', 5.8, 'Sully');
INSERT INTO public.planet VALUES (31, 4, 'Gliese 667 Cc', 'Exoplanet', 4.5, 7000.000, false, '2009-12-20', 23.6, NULL);
INSERT INTO public.planet VALUES (32, 2, 'Kepler-62f', 'Exoplanet', 2.8, 7800.000, false, '2013-04-18', 1200, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Alpha Centauri A', 'Main Sequence', 1.1, 695700, 5790);
INSERT INTO public.star VALUES (2, 2, 'Betelgeuse', 'Red Supergiant', 18, 95000, 3500);
INSERT INTO public.star VALUES (3, 3, 'Sirius A', 'Main Sequence', 2, 1180000, 9940);
INSERT INTO public.star VALUES (4, 4, 'Proxima Centauri', 'Red Dwarf', 0.12, 192000, 3050);
INSERT INTO public.star VALUES (5, 5, 'Rigel', 'Blue Supergiant', 21, 944000, 12000);
INSERT INTO public.star VALUES (6, 6, 'Arcturus', 'Red Giant', 1.5, 253000, 4300);
INSERT INTO public.star VALUES (7, 7, 'Alpha Centauri B', 'Main Sequence', 0.9, 696000, 5790);
INSERT INTO public.star VALUES (8, 8, 'Antares', 'Red Supergiant', 12, 800000, 3500);
INSERT INTO public.star VALUES (9, 9, 'Vega', 'Main Sequence', 2.1, 1800000, 9600);
INSERT INTO public.star VALUES (10, 10, 'Altair', 'Main Sequence', 1.8, 1500000, 7500);
INSERT INTO public.star VALUES (11, 11, 'Capella', 'Giant', 2, 1040000, 5200);
INSERT INTO public.star VALUES (12, 12, 'Spica', 'Binary', 10.3, 1700000, 22000);
INSERT INTO public.star VALUES (13, 2, 'Fomalhaut', 'Main Sequence', 1.92, 1290000, 8600);
INSERT INTO public.star VALUES (14, 6, 'Aldebaran', 'Red Giant', 1.5, 600000, 4300);
INSERT INTO public.star VALUES (15, 12, 'Sirius B', 'White Dwarf', 1, 5300, 25000);


--
-- Name: asteriod_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteriod_asteroid_id_seq', 16, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 32, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 15, true);


--
-- Name: asteroid asteriod_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteriod_name_key UNIQUE (name);


--
-- Name: asteroid asteriod_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteriod_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteriod_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteriod_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: asteroid asteriod_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteriod_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

