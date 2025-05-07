-- Answering Business Queries
--- 1. Which road user is most likely to be involved in multiple fatal crashes?
SELECT road_user_id, SUM(number_fatalities) AS “Number_of_Deaths”
FROM fatalities_fact
WHERE crashtype_id = (SELECT crashtype_id FROM dim_crashtype WHERE crash_type = 'Multiple')
GROUP BY road_user_id
ORDER BY road_user_id ASC;

--- 2. Is the pattern between road crashes and speed limit the same for each state?
SELECT location_id, speed_id, COUNT(crash_id) AS "Number_of_Crashes"
FROM fatalities_fact
GROUP BY CUBE(speed_id, location_id)
ORDER BY location_id, speed_id ASC;

--- 3. How many crashes and fatalities are caused by each female & male drivers & passengers over the years (especially in 2021)?
SELECT COUNT(crash_id) AS “Crashes”, SUM(number_fatalities) AS “Deaths”
FROM fatalities_fact
WHERE date_id IN (SELECT date_id FROM dim_date WHERE year = '2021')
AND road_user_id IN (SELECT road_user_id FROM dim_road_user WHERE road_user = 'Driver')
AND gender_id IN (SELECT gender_id FROM dim_gender WHERE gender = 'Female');

SELECT COUNT(crash_id) AS “Crashes”, SUM(number_fatalities) AS “Deaths”
FROM fatalities_fact
WHERE date_id IN (SELECT date_id FROM dim_date WHERE year = '2021')
AND road_user_id IN (SELECT road_user_id FROM dim_road_user WHERE road_user = 'Driver')
AND gender_id IN (SELECT gender_id FROM dim_gender WHERE gender = 'Male');

SELECT COUNT(crash_id) AS “Crashes”, SUM(number_fatalities) AS “Deaths”
FROM fatalities_fact
WHERE date_id IN (SELECT date_id FROM dim_date WHERE year = '2021')
AND road_user_id IN (SELECT road_user_id FROM dim_road_user WHERE road_user = 'Passenger')
AND gender_id IN (SELECT gender_id FROM dim_gender WHERE gender = 'Female');

SELECT COUNT(crash_id) AS “Crashes”, SUM(number_fatalities) AS “Deaths”
FROM fatalities_fact
WHERE date_id IN (SELECT date_id FROM dim_date WHERE year = '2021')
AND road_user_id IN (SELECT road_user_id FROM dim_road_user WHERE road_user = 'Passenger')
AND gender_id IN (SELECT gender_id FROM dim_gender WHERE gender = 'Male');

--- 4. Are there timing patterns of road fatalities (time of the day & day type)?
SELECT AVG(number_fatalities) AS "Deaths"
FROM fatalities_fact
WHERE date_id IN (SELECT date_id FROM dim_date WHERE day_type = 'Weekday')
AND time_id IN (SELECT time_id FROM dim_time WHERE time_of_day = 'Day');

SELECT AVG(number_fatalities) AS "Deaths"
FROM fatalities_fact
WHERE date_id IN (SELECT date_id FROM dim_date WHERE day_type = 'Weekday')
AND time_id IN (SELECT time_id FROM dim_time WHERE time_of_day = 'Night');

SELECT AVG(number_fatalities) AS "Deaths"
FROM fatalities_fact
WHERE date_id IN (SELECT date_id FROM dim_date WHERE day_type = 'Weekend')
AND time_id IN (SELECT time_id FROM dim_time WHERE time_of_day = 'Day');

SELECT AVG(number_fatalities) AS "Deaths"
FROM fatalities_fact
WHERE date_id IN (SELECT date_id FROM dim_date WHERE day_type = 'Weekend')
AND time_id IN (SELECT time_id FROM dim_time WHERE time_of_day = 'Night');

--- 5. Which specific group of people (age and gender) has the biggest number of road fatalities?
SELECT age_id, gender_id, number_fatalities
FROM fatalities_fact
GROUP BY (age_id, gender_id, number_fatalities)
ORDER BY number_fatalities DESC
LIMIT 1;
