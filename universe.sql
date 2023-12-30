--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)

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
    name character varying(60) NOT NULL,
    magnitude numeric(3,1),
    distance_years integer,
    constellation text,
    stars integer,
    is_elliptical boolean,
    is_spiral boolean
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
    name character varying(60) NOT NULL,
    planet_id integer,
    magnitude numeric(3,1),
    diameter_km integer,
    orbital_period_days integer,
    surface_composition text,
    has_atmosphere boolean,
    has_rings boolean
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance integer,
    magnitude numeric(3,1),
    density integer,
    type text,
    is_planetary boolean,
    is_globular boolean
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer,
    atmosphere_description text,
    magnitude numeric(3,1),
    day_surf_temp_f integer,
    diameter_km integer,
    has_ring_system boolean,
    is_dwarf boolean
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
    name character varying(60) NOT NULL,
    distance_years integer,
    messier_num integer,
    magnitude numeric(3,1),
    constellation text,
    is_planetary_nebula boolean,
    is_globular_cluster boolean,
    galaxy_id integer
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'M61', 10.2, 55000000, 'Virgo', NULL, false, true);
INSERT INTO public.galaxy VALUES (6, 'M31', 3.1, 2000000, 'Andromeda', NULL, false, true);
INSERT INTO public.galaxy VALUES (7, 'M102', 10.7, 44000000, 'Draco', NULL, true, true);
INSERT INTO public.galaxy VALUES (8, 'M51', 8.4, 31000000, 'Canes Venatici', NULL, false, true);
INSERT INTO public.galaxy VALUES (9, 'M94', 9.0, 16000000, 'Canes Venatici', NULL, false, true);
INSERT INTO public.galaxy VALUES (10, 'M110', 8.0, 2700000, 'Andromeda', NULL, true, false);
INSERT INTO public.galaxy VALUES (11, 'The Milky Way', 20.2, 26000, NULL, NULL, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, -12.7, 3474, 27, 'Rocky and dusty, with plains, mountains, and impact craters.', false, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.3, 22200, 8, 'Covered in regolith, grooved terrain.', false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12.4, 12400, 30, 'Smooth and cratered.', false, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 5.0, 3642, 2, 'Volcanically active with sulfur-rich plains.', false, false);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 5.3, 3121, 4, 'Ice-covered with subsurface ocean.', false, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 4.6, 5268, 7, 'Icy with grooved terrain and impact craters.', false, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 5.6, 4820, 17, 'Heavily cratered, ice and rock.', false, false);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 8.3, 5150, 16, 'Thick atmosphere, lakes, and rivers of methane and ethane.', true, false);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 11.7, 504, 1, 'Icy with geysers of water vapor.', false, false);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 12.9, 396, 1, 'Heavily cratered, with a large Herschel crater.', false, false);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 9.7, 1527, 5, 'Icy and cratered, with a wispy, tenuous atmosphere.', false, false);
INSERT INTO public.moon VALUES (12, 'Dione', 6, 10.4, 1123, 3, 'Icy with bright cliffs and impact craters.', false, false);
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 10.2, 1062, 2, 'Heavily cratered, with a large impact basin.', false, false);
INSERT INTO public.moon VALUES (14, 'Hyperion', 6, 14.1, 360, 21, 'Irregular shape, porous, and chaotic terrain.', false, false);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 14.4, 1157, 3, 'Icy with fault lines, valleys, and large canyons.', false, false);
INSERT INTO public.moon VALUES (16, 'Umbriel', 7, 14.7, 1169, 4, 'Dark and heavily cratered, with no apparent geological activity.', false, false);
INSERT INTO public.moon VALUES (17, 'Miranda', 7, 15.8, 472, 1, 'Varied terrain with ice canyons and large, faulted valleys.', false, false);
INSERT INTO public.moon VALUES (18, 'Triton', 8, 13.5, 2706, 6, 'Cold, icy surface with geysers of nitrogen and water.', true, false);
INSERT INTO public.moon VALUES (19, 'Proteus', 8, 16.9, 420, 1, 'Irregular shape, heavily cratered, and large impact basins.', false, false);
INSERT INTO public.moon VALUES (20, 'Charon', 9, 16.8, 1212, 6, 'Varied terrain with canyons, mountains, and a dark pole.', true, false);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Orion (M42)', 1344, 4.0, NULL, 'Emission nebula', NULL, NULL);
INSERT INTO public.nebula VALUES (2, 'Eagle (M16)', 7000, 6.0, NULL, 'Diffuse emission nebula', NULL, NULL);
INSERT INTO public.nebula VALUES (3, 'Lagoon (M8)', 4100, 6.0, NULL, 'Emission nebula', NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'thin exosphere', 5.5, 800, 4880, false, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Thick and mostly composed of carbon dioxide with clouds of sulfuric acid.', -4.6, 869, 12104, false, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Nitrogen, oxygen, trace gases.', -3.0, 57, 12742, false, false);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Thin atmosphere primarily composed of carbon dioxide.', 1.8, -81, 6779, false, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Hydrogen, helium, and methane.', 5.9, 0, 50724, true, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Thick atmosphere mainly composed of hydrogen and helium.', -2.9, 0, 139820, true, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Thick atmosphere mostly composed of hydrogen and helium.', 1.2, 0, 116460, true, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Hydrogen, helium, and methane.', 8.0, 0, 49244, true, false);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 'Thin nitrogen and methane atmosphere.', 16.3, -1, 2377, false, true);
INSERT INTO public.planet VALUES (10, 'Eris', 1, 'Thin atmosphere with methane.', 18.7, -1, 2326, false, true);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 7, 'tidally locked to its star', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'WASP-121b', 8, 'a hot Jupiter with extreme atmospheric conditions, including high temperatures and intense winds.', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'Kepler-186f', 9, 'assumed to be a potentially rocky exoplanet.', NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0, NULL, -26.7, NULL, NULL, NULL, 11);
INSERT INTO public.star VALUES (2, 'Sirius', 9, NULL, -1.5, NULL, NULL, NULL, 11);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 643, NULL, 0.5, 'Orion', NULL, NULL, 11);
INSERT INTO public.star VALUES (4, 'Aldebaran', 65, NULL, 0.9, 'Taurus', NULL, NULL, 11);
INSERT INTO public.star VALUES (5, 'Deneb', 2600, NULL, 1.3, 'Cygnus', NULL, NULL, 11);
INSERT INTO public.star VALUES (6, 'Vega', 25, NULL, 0.0, 'Lyra', NULL, NULL, 11);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 4, NULL, 11.1, 'Centaurus', NULL, NULL, 11);
INSERT INTO public.star VALUES (8, 'WASP-121', -1, NULL, -1.0, 'Puppis', NULL, NULL, 11);
INSERT INTO public.star VALUES (9, 'Kepler-186', 500, NULL, -1.0, 'Cygnus', NULL, NULL, 11);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 11, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


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
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_nebula_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_nebula_id_key UNIQUE (nebula_id);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

