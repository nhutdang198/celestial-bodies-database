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
    name character varying(200) NOT NULL,
    description text NOT NULL,
    discovered_year integer
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
    name character varying(200) NOT NULL,
    description text NOT NULL,
    type text,
    diameter_light_years numeric,
    number_of_stars bigint,
    discovered_by text,
    discovered_year integer
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
    name character varying(200) NOT NULL,
    description text NOT NULL,
    planet_id integer,
    radius_km numeric,
    orbital_period_days numeric,
    has_water_ice boolean,
    surface_temperature_celsius numeric
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
    name character varying(200) NOT NULL,
    description text NOT NULL,
    star_id integer,
    type text,
    mass_earth numeric,
    radius_km numeric,
    orbital_period_days numeric,
    has_atmosphere boolean,
    has_life boolean
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
    name character varying(200) NOT NULL,
    description text NOT NULL,
    galaxy_id integer,
    spectral_type text,
    mass_solar numeric,
    radius_solar numeric,
    temperature_kelvin integer,
    age_billion_years numeric
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

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'The largest asteroid in the Solar System.', 1801);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'The second largest asteroid in the Solar System.', 1801);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'The third largest asteroid in the Solar System.', 1801);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 'The fourth largest asteroid in the Solar System.', 1801);
INSERT INTO public.asteroid VALUES (5, 'Eros', 'The fifth largest asteroid in the Solar System.', 1801);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, containing the Solar System.', 'Spiral', 105700, 250000000000, 'Unknown', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest spiral galaxy to the Milky Way.', 'Spiral', 220000, 1000000000000, 'Simon Marius', 1612);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A member of the Local Group, smaller than Andromeda.', 'Spiral', 60000, 40000000000, 'Charles Messier', 1764);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'A galaxy with a bright nucleus and a large central bulge.', 'Spiral', 50000, 80000000000, 'Pierre Méchain', 1781);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way.', 'Irregular', 14000, 10000000000, 'Ferdinand Magellan', 1519);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 'Another satellite galaxy of the Milky Way.', 'Irregular', 7000, 3000000000, 'Ferdinand Magellan', 1519);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The natural satellite of Earth.', 1, 1737.4, 27.3, false, -20);
INSERT INTO public.moon VALUES (2, 'Phobos', 'A moon of Mars.', 2, 11.1, 0.319, false, -40);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Another moon of Mars.', 2, 6.2, 1.263, false, -40);
INSERT INTO public.moon VALUES (4, 'Europa', 'A moon of Jupiter with a subsurface ocean.', 5, 1560.8, 3.551, true, -160);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'The largest moon in the Solar System.', 5, 2634.1, 7.155, false, -120);
INSERT INTO public.moon VALUES (6, 'Titan', 'A moon of Saturn with a thick atmosphere.', 6, 2575.5, 15.945, true, -180);
INSERT INTO public.moon VALUES (7, 'Enceladus', 'A moon of Saturn with water geysers.', 6, 252.1, 1.37, true, -200);
INSERT INTO public.moon VALUES (8, 'Triton', 'A moon of Neptune with retrograde orbit.', 8, 1353.4, 5.877, true, -235);
INSERT INTO public.moon VALUES (9, 'Charon', 'The largest moon of Pluto.', 9, 606.0, 6.387, false, -220);
INSERT INTO public.moon VALUES (10, 'Moon', 'The natural satellite of Earth.', 1, 1737.4, 27.3, false, -20);
INSERT INTO public.moon VALUES (11, 'Phobos', 'A moon of Mars.', 2, 11.1, 0.319, false, -40);
INSERT INTO public.moon VALUES (12, 'Deimos', 'Another moon of Mars.', 2, 6.2, 1.263, false, -40);
INSERT INTO public.moon VALUES (13, 'Europa', 'A moon of Jupiter with a subsurface ocean.', 5, 1560.8, 3.551, true, -160);
INSERT INTO public.moon VALUES (14, 'Ganymede', 'The largest moon in the Solar System.', 5, 2634.1, 7.155, false, -120);
INSERT INTO public.moon VALUES (15, 'Titan', 'A moon of Saturn with a thick atmosphere.', 6, 2575.5, 15.945, true, -180);
INSERT INTO public.moon VALUES (16, 'Enceladus', 'A moon of Saturn with water geysers.', 6, 252.1, 1.37, true, -200);
INSERT INTO public.moon VALUES (17, 'Triton', 'A moon of Neptune with retrograde orbit.', 8, 1353.4, 5.877, true, -235);
INSERT INTO public.moon VALUES (18, 'Charon', 'The largest moon of Pluto.', 9, 606.0, 6.387, false, -220);
INSERT INTO public.moon VALUES (19, 'Io', 'A moon of Jupiter with a subsurface ocean.', 5, 1821.6, 1.769, true, -180);
INSERT INTO public.moon VALUES (20, 'Callisto', 'A moon of Jupiter with a subsurface ocean.', 5, 2410.3, 16.689, true, -160);
INSERT INTO public.moon VALUES (21, 'Mimas', 'A moon of Saturn with a subsurface ocean.', 6, 198.2, 0.942, true, -180);
INSERT INTO public.moon VALUES (22, 'Rhea', 'A moon of Saturn with a subsurface ocean.', 6, 764.5, 4.5, true, -180);
INSERT INTO public.moon VALUES (23, 'Tethys', 'A moon of Saturn with a subsurface ocean.', 6, 531.1, 1.6, true, -180);
INSERT INTO public.moon VALUES (24, 'Dione', 'A moon of Saturn with a subsurface ocean.', 6, 561.4, 2.2, true, -180);
INSERT INTO public.moon VALUES (25, 'Iapetus', 'A moon of Saturn with a subsurface ocean.', 6, 734.5, 7.15, true, -180);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our home planet.', 1, 'Terrestrial', 1.0, 6371.0, 365.25, true, true);
INSERT INTO public.planet VALUES (2, 'Mars', 'The second planet from the Sun.', 1, 'Terrestrial', 0.642, 3389.5, 687.0, true, false);
INSERT INTO public.planet VALUES (3, 'Venus', 'The third planet from the Sun.', 1, 'Terrestrial', 0.815, 6051.8, 224.7, true, false);
INSERT INTO public.planet VALUES (4, 'Mercury', 'The smallest planet in the Solar System.', 1, 'Terrestrial', 0.055, 2440.0, 88.0, false, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in the Solar System.', 1, 'Gas Giant', 317.8, 69911.0, 4332.0, true, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The second largest planet in the Solar System.', 1, 'Gas Giant', 95.2, 58232.0, 10759.0, true, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 'The fourth planet from the Sun.', 1, 'Ice Giant', 14.5, 25362.0, 30687.0, true, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The fifth planet from the Sun.', 1, 'Ice Giant', 17.2, 24622.0, 60190.0, true, false);
INSERT INTO public.planet VALUES (9, 'Pluto', 'The dwarf planet closest to the Sun.', 1, 'Dwarf Planet', 0.00218, 1187.0, 90560.0, false, false);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 'A planet in the Kepler-186 system.', 1, 'Terrestrial', 1.0, 0.0, 0.0, false, false);
INSERT INTO public.planet VALUES (11, 'Kepler-186g', 'A planet in the Kepler-186 system.', 1, 'Terrestrial', 1.0, 0.0, 0.0, false, false);
INSERT INTO public.planet VALUES (12, 'Kepler-186h', 'A planet in the Kepler-186 system.', 1, 'Terrestrial', 1.0, 0.0, 0.0, false, false);
INSERT INTO public.planet VALUES (13, 'Kepler-186i', 'A planet in the Kepler-186 system.', 1, 'Terrestrial', 1.0, 0.0, 0.0, false, false);
INSERT INTO public.planet VALUES (14, 'Kepler-186j', 'A planet in the Kepler-186 system.', 1, 'Terrestrial', 1.0, 0.0, 0.0, false, false);
INSERT INTO public.planet VALUES (15, 'Kepler-186k', 'A planet in the Kepler-186 system.', 1, 'Terrestrial', 1.0, 0.0, 0.0, false, false);
INSERT INTO public.planet VALUES (16, 'Kepler-186l', 'A planet in the Kepler-186 system.', 1, 'Terrestrial', 1.0, 0.0, 0.0, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of the Solar System.', 1, 'G2V', 1.0, 1.0, 5778, 4.6);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'The closest known star to the Sun.', 2, 'M5.5Ve', 0.122, 0.154, 3042, 4.85);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A red supergiant star in the Orion constellation.', 3, 'M2Iab', 11.6, 887, 3500, 8.0);
INSERT INTO public.star VALUES (4, 'Rigel', 'A blue supergiant star in the Orion constellation.', 3, 'B8Ia', 21.0, 78.9, 11000, 8.0);
INSERT INTO public.star VALUES (5, 'Sirius', 'The brightest star in the night sky.', 2, 'A1V', 2.063, 1.711, 9940, 0.242);
INSERT INTO public.star VALUES (6, 'Vega', 'A bright star in the Lyra constellation.', 2, 'A0V', 2.135, 2.362, 9602, 0.455);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_unique UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: asteroid moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moooon_planet_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moooon_planet_id_unique UNIQUE (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


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

