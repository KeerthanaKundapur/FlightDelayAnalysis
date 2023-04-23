create table if not exists airports(
IATA_CODE varchar(100) PRIMARY KEY,AIRPORT VARCHAR(100),CITY VARCHAR(100),
STATE varchar(100),COUNTRY varchar(100),LATITUDE float,LONGITUDE float);

create table if not exists airlines(
IATA_CODE varchar(100) primary key,AIRLINE varchar(100));

create table if not exists flights(
YEAR INT,MONTH INT,DAY INT,DAY_OF_WEEK INT,
AIRLINE varchar(100), FLIGHT_NUMBER INT,
TAIL_NUMBER VARCHAR(100),ORIGIN_AIRPORT varchar(100),
DESTINATION_AIRPORT varchar(100),SCHEDULED_DEPARTURE INT,
DEPARTURE_TIME INT,DEPARTURE_DELAY INT,
TAXI_OUT INT,WHEELS_OFF INT,SCHEDULED_TIME INT,
ELAPSED_TIME INT,AIR_TIME INT,DISTANCE INT,
WHEEL_ON INT,TAXI_ON INT,SCHEDULED_ARRIVAL INT,
ARRIVAL_TIME INT,ARRIVAL_DELAY INT,DIVERTED INT,
CANCELLED INT,CANCELLATION_REASON VARCHAR(100),
AIR_SYSTEM_DELAY INT,SECURITY_DELAY INT,AIRLINE_DELAY INT,
LATE_AIRCRAFT_DELAY INT,WEATHER_DELAY INT,
FOREIGN KEY(AIRLINE) REFERENCES airlines(IATA_CODE));

Select count *
from "flights";

Select *
from "airlines";

SELECT *
FROM "airports";

--KPI1: Weekday Vs Weekend total flights
		
select(select count("day_of_week")
from "flights"
where "day_of_week"<=5)as "Weekday",
	  (select count("day_of_week")
from "flights"
where "day_of_week">=6)as "Weekend",
      (select count("day_of_week")
from "flights")as "Total Flights";

--KPI2:Total number of cancelled flights for JetBlue Airways on first date of every month.
SELECT COUNT(*)AS "Cancelled Flights"
FROM "Flight"
WHERE "AIRLINE"='B6' 
AND "CANCELLED"=1 
AND "DAY"=1
AND "MONTH"=2;
