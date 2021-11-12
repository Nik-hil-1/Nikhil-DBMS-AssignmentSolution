-- How many females and how many male passengers travelled for a minimum distance of 600 KM s? -- 
select gender, count(gender) gendercount from (select gender from passenger where Distance>=600) T group by Gender;

-- Find the minimum ticket price for Sleeper Bus.-- 
select min(price) from price where Bus_Type='sleeper';

-- Select passenger names whose names start with character 'S'-- 
select passenger_name from passenger where Passenger_name like 's%';

-- Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output-- 
select Passenger_name, Boarding_City, Destination_City, pa.Distance, pa.Bus_Type, pr.Price from passenger pa, price pr where pa.Distance=pr.Distance and pa.Bus_Type=pr.Bus_Type;

-- What is the passenger name and his/her ticket price who travelled in Sitting bus  for a distance of 1000 KM s -- 
select pa.passenger_name, pr.Price from passenger pa, price pr where pa.Bus_Type='sitting' and pa.Distance = 1000;

-- What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?-- 
select bus_type, price from price where Distance = (select Distance from passenger where Passenger_name='pallavi');

-- List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order. -- 
select distinct distance from passenger order by Distance desc;

 -- Display the passenger name and percentage of distance travelled by that passenger from the total distance travelled by all passengers without using user variables-- 
select passenger_name, (distance/(select sum(Distance) from passenger) *100) perc from passenger;

-- Display the distance, price in three categories in table Price -- 
-- a) Expensive if the cost is more than 1000 -- 
-- b) Average Cost if the cost is less than 1000 and greater than 500 -- 
-- c) Cheap otherwise-- 
select distinct distance, price,
case
when price>1000 then 'Expensive'
when price<1000 and price>500 then 'Average Cost'
else 'cheap'
end as Label from price;
