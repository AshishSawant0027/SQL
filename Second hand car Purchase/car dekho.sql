create database car_dekho;
use car_dekho;
show tables;
select * from `car dekho` limit 10;
alter table `car dekho` rename TO car_details;
select * from car_details limit 10;
--- ------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1. Average selling price of cars:
SELECT AVG(selling_price) AS avg_selling_price
FROM car_details;

--- ------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2. Total count of cars by fuel type:
SELECT fuel, COUNT(*) AS count
FROM car_details
GROUP BY fuel;

--- ------------------------------------------------------------------------------------------------------------------------------------------------------
-- 3. Average mileage of the cars:
SELECT round(AVG(mileage),2) AS avg_mileage
FROM car_details;

--- ------------------------------------------------------------------------------------------------------------------------------------------------------
-- 4. Total count of cars by transmission type:
SELECT transmission, COUNT(*) AS count
FROM car_details
GROUP BY transmission;

--------------------------------------------------------------------------------------------------------------------------------------------------
-- 5.Percentage of cars sold by each seller type:
SELECT seller_type, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM car_details) AS percentage
FROM car_details
GROUP BY seller_type;

--- ------------------------------------------------------------------------------------------------------------------------------------------------------
-- 6. Percentage of cars with manual transmission and high mileage:
SELECT (COUNT(CASE WHEN transmission = 'Manual' AND mileage > 20 THEN 1 END)) AS percentage_manual_high_mileage
FROM car_details;

--- ------------------------------------------------------------------------------------------------------------------------------------------------------
-- 7. Percentage of cars with torque greter than 100nm information:
SELECT (COUNT(CASE WHEN torque>100  THEN 1 END) * 100.0 / COUNT(*)) AS percentage_missing_torque_info
FROM car_details;

--- ------------------------------------------------------------------------------------------------------------------------------------------------------
-- 8. Average selling price per seat:
SELECT seats, AVG(selling_price) AS avg_selling_price_per_seat
FROM car_details
GROUP BY seats;

--- ------------------------------------------------------------------------------------------------------------------------------------------------------
-- 9. Average price difference between individual and dealer sellers:
SELECT AVG(CASE WHEN seller_type = 'Individual' THEN selling_price ELSE 0 END) - AVG(CASE WHEN seller_type = 'Dealer' THEN selling_price ELSE 0 END) AS avg_price_difference
FROM car_details;

--- ------------------------------------------------------------------------------------------------------------------------------------------------------
-- 10. Percentage of cars with above average power:
SELECT round((COUNT(CASE WHEN max_power > (SELECT AVG(max_power) FROM car_details) THEN 1 END) * 100.0 / COUNT(*)),0) AS percentage_above_avg_power
FROM car_details;

--- ------------------------------------------------------------------------------------------------------------------------------------------------------
-- 11. Average selling price per year of ownership:
SELECT owner, round(AVG(selling_price / (2024 - year)),2) AS avg_selling_price_per_year_of_ownership
FROM car_details
GROUP BY owner;

--- ------------------------------------------------------------------------------------------------------------------------------------------------------
-- 12. Average selling price by fuel and transmission type:
SELECT fuel, transmission, AVG(selling_price) AS avg_selling_price
FROM car_details
GROUP BY fuel, transmission;


