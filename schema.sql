create schema TravelOnTheGo;
use TravelOnTheGo;

create table PASSENGER(Passenger_name varchar(100), Category varchar(10), Gender varchar(5), Boarding_City varchar(100), Destination_City varchar(100), Distance int, Bus_Type varchar(20)); 
create table PRICE(Bus_Type varchar(20), Distance int, Price int, unique(distance,price));
