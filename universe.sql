CREATE DATABASE universe;
DROP DATABASE universe;
DROP TABLE galaxy;
DROP TABLE moon;

CREATE TABLE public.galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    description TEXT,
    type TEXT, -- e.g. Spiral, Elliptical, Irregular
    diameter_light_years NUMERIC,
    number_of_stars BIGINT,
    discovered_by TEXT,
    discovered_year INTEGER
);

CREATE TABLE public.star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    description TEXT,
    galaxy_id INTEGER REFERENCES public.galaxy(galaxy_id),
    spectral_type TEXT,
    mass_solar NUMERIC,
    radius_solar NUMERIC,
    temperature_kelvin INTEGER,
    age_billion_years NUMERIC
);

CREATE TABLE public.planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    description TEXT,
    star_id INTEGER REFERENCES public.star(star_id),
    type TEXT, -- e.g. Terrestrial, Gas Giant, Ice Giant
    mass_earth NUMERIC,
    radius_km NUMERIC,
    orbital_period_days NUMERIC,
    has_atmosphere BOOLEAN,
    has_life BOOLEAN
);

CREATE TABLE public.moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    description TEXT,
    planet_id INTEGER REFERENCES public.planet(planet_id),
    radius_km NUMERIC,
    orbital_period_days NUMERIC,
    has_water_ice BOOLEAN,
    surface_temperature_celsius NUMERIC
);


INSERT INTO public.galaxy (name, description, type, diameter_light_years, number_of_stars, discovered_by, discovered_year)
VALUES
    ('Milky Way', 'Our home galaxy, containing the Solar System.', 'Spiral', 105700, 250000000000, 'Unknown', NULL),
    ('Andromeda', 'The nearest spiral galaxy to the Milky Way.', 'Spiral', 220000, 1000000000000, 'Simon Marius', 1612),
    ('Triangulum', 'A member of the Local Group, smaller than Andromeda.', 'Spiral', 60000, 40000000000, 'Charles Messier', 1764),
    ('Sombrero Galaxy', 'A galaxy with a bright nucleus and a large central bulge.', 'Spiral', 50000, 80000000000, 'Pierre Méchain', 1781),
    ('Large Magellanic Cloud', 'A satellite galaxy of the Milky Way.', 'Irregular', 14000, 10000000000, 'Ferdinand Magellan', 1519),
    ('Small Magellanic Cloud', 'Another satellite galaxy of the Milky Way.', 'Irregular', 7000, 3000000000, 'Ferdinand Magellan', 1519);


INSERT INTO public.star (name, description, galaxy_id, spectral_type, mass_solar, radius_solar, temperature_kelvin, age_billion_years)
VALUES 
    ('Sun', 'The star at the center of the Solar System.', 1, 'G2V', 1.0, 1.0, 5778, 4.6),
    ('Proxima Centauri', 'The closest known star to the Sun.', 2, 'M5.5Ve', 0.122, 0.154, 3042, 4.85),
    ('Betelgeuse', 'A red supergiant star in the Orion constellation.', 3, 'M2Iab', 11.6, 887, 3500, 8.0),
    ('Rigel', 'A blue supergiant star in the Orion constellation.', 3, 'B8Ia', 21.0, 78.9, 11000, 8.0),
    ('Sirius', 'The brightest star in the night sky.', 2, 'A1V', 2.063, 1.711, 9940, 0.242),
    ('Vega', 'A bright star in the Lyra constellation.', 2, 'A0V', 2.135, 2.362, 9602, 0.455);

INSERT INTO public.planet(name, description, star_id, type, mass_earth, radius_km, orbital_period_days, has_atmosphere, has_life)
VALUES
    ('Earth', 'Our home planet.', 1, 'Terrestrial', 1.0, 6371.0, 365.25, true, true),
    ('Mars', 'The second planet from the Sun.', 1, 'Terrestrial', 0.642, 3389.5, 687.0, true, false),
    ('Venus', 'The third planet from the Sun.', 1, 'Terrestrial', 0.815, 6051.8, 224.7, true, false),
    ('Mercury', 'The smallest planet in the Solar System.', 1, 'Terrestrial', 0.055, 2440.0, 88.0, false, false),
    ('Jupiter', 'The largest planet in the Solar System.', 1, 'Gas Giant', 317.8, 69911.0, 4332.0, true, false),
    ('Saturn', 'The second largest planet in the Solar System.', 1, 'Gas Giant', 95.2, 58232.0, 10759.0, true, false),
    ('Uranus', 'The fourth planet from the Sun.', 1, 'Ice Giant', 14.5, 25362.0, 30687.0, true, false), 
    ('Neptune', 'The fifth planet from the Sun.', 1, 'Ice Giant', 17.2, 24622.0, 60190.0, true, false),
    ('Pluto', 'The dwarf planet closest to the Sun.', 1, 'Dwarf Planet', 0.00218, 1187.0, 90560.0, false, false),
    ('Kepler-186f', 'A planet in the Kepler-186 system.', 1, 'Terrestrial', 1.0, 0.0, 0.0, false, false),
    ('Kepler-186g', 'A planet in the Kepler-186 system.', 1, 'Terrestrial', 1.0, 0.0, 0.0, false, false),
    ('Kepler-186h', 'A planet in the Kepler-186 system.', 1, 'Terrestrial', 1.0, 0.0, 0.0, false, false),
    ('Kepler-186i', 'A planet in the Kepler-186 system.', 1, 'Terrestrial', 1.0, 0.0, 0.0, false, false),
    ('Kepler-186j', 'A planet in the Kepler-186 system.', 1, 'Terrestrial', 1.0, 0.0, 0.0, false, false),
    ('Kepler-186k', 'A planet in the Kepler-186 system.', 1, 'Terrestrial', 1.0, 0.0, 0.0, false, false),
    ('Kepler-186l', 'A planet in the Kepler-186 system.', 1, 'Terrestrial', 1.0, 0.0, 0.0, false, false);


INSERT INTO public.moon (name, description, planet_id, radius_km, orbital_period_days, has_water_ice, surface_temperature_celsius)
VALUES 
    ('Moon', 'The natural satellite of Earth.', 1, 1737.4, 27.3, false, -20),
    ('Phobos', 'A moon of Mars.', 2, 11.1, 0.319, false, -40),
    ('Deimos', 'Another moon of Mars.', 2, 6.2, 1.263, false, -40),
    ('Europa', 'A moon of Jupiter with a subsurface ocean.', 5, 1560.8, 3.551, true, -160),
    ('Ganymede', 'The largest moon in the Solar System.', 5, 2634.1, 7.155, false, -120),
    ('Titan', 'A moon of Saturn with a thick atmosphere.', 6, 2575.5, 15.945, true, -180),
    ('Enceladus', 'A moon of Saturn with water geysers.', 6, 252.1, 1.37, true, -200),
    ('Triton', 'A moon of Neptune with retrograde orbit.', 8, 1353.4, 5.877, true, -235),
    ('Charon', 'The largest moon of Pluto.', 9, 606.0, 6.387, false, -220);