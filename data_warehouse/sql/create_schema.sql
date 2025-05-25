-- Delete tables if these exists
DROP TABLE IF EXISTS dim_age CASCADE;
DROP TABLE IF EXISTS dim_crashtype CASCADE;
DROP TABLE IF EXISTS dim_date CASCADE;
DROP TABLE IF EXISTS dim_gender CASCADE;
DROP TABLE IF EXISTS dim_location CASCADE;
DROP TABLE IF EXISTS dim_road_user CASCADE;
DROP TABLE IF EXISTS dim_speedlimit CASCADE;
DROP TABLE IF EXISTS dim_time CASCADE;
DROP TABLE IF EXISTS dim_vehicle CASCADE;
DROP TABLE IF EXISTS fatalities_fact CASCADE;

-- Create 9 dimension tables, each with their own primary key

-- Create dimension table for date
CREATE TABLE dim_date (
	Date_ID INT PRIMARY KEY,
	Month VARCHAR(20), 
	Year INT,
	Day VARCHAR(20),
	Day_Type VARCHAR(20),
	Christmas_Period VARCHAR(5),
	Easter_Period VARCHAR(5)
);

-- Create dimension table for time
CREATE TABLE dim_time (
	Time_ID INT PRIMARY KEY,
	Time TIME,
	Time_of_Day VARCHAR(20)
);

-- Create dimension table for location
CREATE TABLE dim_location (
	Location_ID INT PRIMARY KEY,
	State VARCHAR(20)
);

-- Create dimension table for vehicle
CREATE TABLE dim_vehicle (
	Vehicle_ID INT PRIMARY KEY,
	Bus_Involvement VARCHAR(20),
	Heavy_Rigid_Truck_Involvement VARCHAR(20),
	Articulated_Truck_Involvement VARCHAR(20)
);

-- Create dimension table for speed limit
CREATE TABLE dim_speedlimit (
	Speed_ID INT PRIMARY KEY,
	Speed_Limit VARCHAR(20)
);

-- Create dimension table for gender
CREATE TABLE dim_gender (
	Gender_ID INT PRIMARY KEY,
	Gender VARCHAR(20)
);

-- Create dimension table for age
CREATE TABLE dim_age (
	Age_ID INT PRIMARY KEY,
	Age INT,
	Age_Group VARCHAR(20)
);

-- Create dimension table for road user
CREATE TABLE dim_road_user (
	Road_User_ID INT PRIMARY KEY,
	Road_User VARCHAR(30)
);

-- Create dimension table for crash type
CREATE TABLE dim_crashtype (
	CrashType_ID INT PRIMARY KEY,
	Crash_Type VARCHAR(20)
);


-- Create fact table, link the primary keys from dimension tables as foreign keys in the fact table
CREATE TABLE fatalities_fact (
	Crash_ID INT PRIMARY KEY,
	Date_ID INT NOT NULL,
	Time_ID INT NOT NULL,
	Location_ID INT NOT NULL,
	Vehicle_ID INT NOT NULL,
	Speed_ID INT NOT NULL,
	Gender_ID INT NOT NULL,
	Age_ID INT NOT NULL,
	Road_User_ID INT NOT NULL,
	Crashtype_ID INT NOT NULL,
	FOREIGN KEY (Date_ID) REFERENCES dim_date(Date_ID),
	FOREIGN KEY (Time_ID) REFERENCES dim_time(Time_ID),
	FOREIGN KEY (Location_ID) REFERENCES dim_location(Location_ID),
	FOREIGN KEY (Vehicle_ID) REFERENCES dim_vehicle(Vehicle_ID),
	FOREIGN KEY (Speed_ID) REFERENCES dim_speedlimit(Speed_ID),
	FOREIGN KEY (Gender_ID) REFERENCES dim_gender(Gender_ID),
	FOREIGN KEY (Age_ID) REFERENCES dim_age(Age_ID),
	FOREIGN KEY (Road_User_ID) REFERENCES dim_road_user(Road_User_ID),
	FOREIGN KEY (Crashtype_ID) REFERENCES dim_crashtype(Crashtype_ID),
	Number_Fatalities INT NULL
);
