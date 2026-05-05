Select *
From locations

Select *
From stolen_vehicles

Select *
From make_details


 --How many vehicles were stolen each year or month?
 SELECT 
    YEAR(date_stolen) AS theft_year,
    COUNT(vehicle_id) AS total_vehicles_stolen
FROM stolen_vehicles
GROUP BY YEAR(date_stolen)
ORDER BY theft_year;

--How many vehicles were stolen each year and  month?
SELECT 
    YEAR(date_stolen) AS theft_year,
    MONTH(date_stolen) AS theft_month,
    COUNT(vehicle_id) AS total_vehicles_stolen
FROM stolen_vehicles
GROUP BY 
    YEAR(date_stolen),
    MONTH(date_stolen)
ORDER BY 
    theft_year,
    theft_month;

--Which cities have the highest theft rates?

SELECT 
    l.region,
    COUNT(s.vehicle_id) AS total_thefts
FROM stolen_vehicles s
JOIN locations l
    ON s.location_id = l.location_id
GROUP BY l.region
ORDER BY total_thefts DESC;

--What are the top 10 most stolen vehicle makes
SELECT TOP 10
    m.make_name,
    COUNT(s.vehicle_id) AS total_stolen
FROM stolen_vehicles s
JOIN make_details m
    ON s.make_id = m.make_id
GROUP BY m.make_name
ORDER BY total_stolen DESC;

--What are the top 10 most stolen vehicle  models?
SELECT TOP 10
    vehicle_desc,
    COUNT(vehicle_id) AS total_stolen
FROM stolen_vehicles
GROUP BY vehicle_desc
ORDER BY total_stolen DESC;


