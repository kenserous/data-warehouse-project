-- Populate the data
-- Insert data to dim_date
COPY dim_date FROM 'dim_tables/dim_date.csv' WITH (FORMAT csv, HEADER true);

-- Insert data to dim_time
COPY dim_time FROM 'dim_tables/dim_time.csv' WITH (FORMAT csv, HEADER true)

-- Insert data to dim_location
COPY dim_location FROM 'dim_tables/dim_location.csv' WITH (FORMAT csv, HEADER true)

-- Insert data to dim_vehicle
COPY dim_vehicle FROM 'dim_tables/dim_vehicle.csv' WITH (FORMAT csv, HEADER true)

-- Insert data to dim_speedlimit
COPY dim_speedlimit FROM 'dim_tables/dim_speedlimit.csv' WITH (FORMAT csv, HEADER true)

-- Insert data to dim_gender
COPY dim_gender FROM 'dim_tables/dim_gender.csv' WITH (FORMAT csv, HEADER true)

-- Insert data to dim_age
COPY dim_age FROM 'dim_tables/dim_age.csv' WITH (FORMAT csv, HEADER true)

-- Insert data to dim_road_user
COPY dim_road_user FROM 'dim_tables/dim_road_user.csv' WITH (FORMAT csv, HEADER true)

-- Insert data to dim_crashtype
COPY dim_crashtype FROM 'dim_tables/dim_crashtype.csv' WITH (FORMAT csv, HEADER true)

-- Insert data to fatalities_fact
COPY fatalities_fact FROM 'dim_tables/fatalities_fact.csv' WITH (FORMAT csv, HEADER true)

