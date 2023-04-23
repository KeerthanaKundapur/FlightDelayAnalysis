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

Select *
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
SELECT "month",COUNT(*)AS "Cancelled Flights"
FROM "flights"
WHERE "airline"='B6' 
AND "cancelled"=1 
AND "day"=1
group by "month";

--KPI3:Week wise statistics of delay of flights with airline details.
SELECT "day_of_week","airline",count(*)as "total_flights",
sum(case when "departure_delay">0 then 1 else 0 end)as "delayed_flights",
avg("departure_delay")as "average_delay"
FROM "flights"
GROUP BY "day_of_week","airline"
ORDER BY"day_of_week","airline","total_flights";


--KPI4:Number of airlines with No departure/arrival delay with distance covered between 2500 and 3000.
SELECT  "airline",COUNT("airline") AS "airlines_no_delay"
FROM "flights"
WHERE "departure_delay"<=0 
AND "arrival_delay"<=0
AND "distance" BETWEEN 2500 AND 3000
GROUP BY "airline";
