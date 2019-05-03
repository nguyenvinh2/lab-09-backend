DROP TABLE IF EXISTS weathers, events, movies, yelp, trails, locations;

CREATE TABLE IF NOT EXISTS locations ( 
  id SERIAL PRIMARY KEY, 
  search_query VARCHAR(255), 
  formatted_query VARCHAR(255), 
  latitude DECIMAL, 
  longitude DECIMAL,
  created_at BIGINT
);

CREATE TABLE IF NOT EXISTS weathers ( 
  id SERIAL PRIMARY KEY, 
  forecast TEXT, 
  time VARCHAR(255), 
  created_at BIGINT,
  location_id INTEGER NOT NULL REFERENCES locations(id) 
);

CREATE TABLE IF NOT EXISTS events (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  link VARCHAR(255),
  event_date VARCHAR(255),
  summary TEXT,
  created_at BIGINT,
  location_id INTEGER NOT NULL REFERENCES locations(id) 
);

CREATE TABLE IF NOT EXISTS movies (
  id SERIAL PRIMARY KEY,
  title TEXT,
  overview TEXT,
  average_votes DECIMAL,
  total_votes INTEGER,
  image_url TEXT,
  popularity DECIMAL,
  released_on VARCHAR(255),
  created_at BIGINT,
  location_id INTEGER NOT NULL REFERENCES locations(id) 
);

CREATE TABLE IF NOT EXISTS yelp ( 
  id SERIAL PRIMARY KEY, 
  name TEXT,
  image_url TEXT,
  price VARCHAR(10),
  rating DECIMAL,
  url TEXT,
  location_id INTEGER NOT NULL REFERENCES locations(id),
  created_at BIGINT
);

CREATE TABLE IF NOT EXISTS trails (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  location VARCHAR(255),
  length DECIMAL,
  stars DECIMAL,
  star_votes DECIMAL,
  summary TEXT,
  trail_url VARCHAR(255),
  conditions TEXT,
  condition_date VARCHAR(255),
  condition_time VARCHAR(255),
  created_at BIGINT,
  location_id INTEGER NOT NULL REFERENCES locations(id)
);