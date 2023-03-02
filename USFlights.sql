Create database USAFlights;
Drop table if exists data1;
CREATE TABLE `usaflights`.`data1` (
  `Year` INT NOT NULL,
  `DayOfMonth` INT ,
  `DayOfWeek` INT ,
  `FlightDate` DATE ,
  `UniqueCarrier` VARCHAR(45) ,
  `AirlineID` VARCHAR(45) ,
  `Carrier` VARCHAR(45) ,
  `CarrierNames` VARCHAR(200),
  `TailNum` VARCHAR(45) NULL,
  `FlightNum` INT ,
   `Origin` VARCHAR(45) ,
  `OriginCityName` VARCHAR(300) ,
  `OriginState` VARCHAR(45) ,
  `OriginStateName` VARCHAR(200) ,
  `Dest` VARCHAR(45),
  `DestCityName` VARCHAR(300) ,
  `DestState` VARCHAR(45) ,
  `DestStateName` VARCHAR(300));
  
  
  Drop table if exists data2;
  
  CREATE TABLE `usaflights`.`data2` (
  `AirlineID`  VARCHAR(45) NOT NULL,
  `TailNum` VARCHAR(45) NULL ,
  `Cancelled` smallint(4),
  `AirTime` varchar(100) NULL,
  `Distance` INT );
  


 
####KPI1:Weekday Vs Weekend total flights:####  
select (select count(`DayOfWeek`)from data1 where `DayOfWeek`<=5) as `Weekday`,
(select count(`DayOfWeek`) from  data1 where `DayOfWeek`>=6)as `Weekend`,
(select count(`DayOfWeek`) from data1 ) as `Total Flights`;


####KPI2: Number of cancelled flights for Honolulu, HI (OriginCityName)####
####Step1
Select `AirlineID`, count(*) as `No. Of Flights` from data1 
where `OriginCityName`="Honolulu, HI" group by `AirlineID` order by `AirlineID` asc;


####Step2
SELECT `AirlineID`, count(*) as `Honolulu Cancelled Flights` FROM data2
WHERE `Cancelled`= 1 and `AirlineID`in (19690,19790,19805,19930,19977) GROUP BY `AirlineID` order by `AirlineID` asc;

####KPI3 Weekwise Statistics of Arrival of flights to Manchester####
Select `OriginCityName`, `DestCityName`, week(`FlightDate`,1) as `Week No`,count(*) AS `No. Of Flights`, 
round(count(`FlightDate`)/count(distinct(`FlightDate`)),2)  as `Average` from data1 
where OriginCityName="Manchester, NH" group by `Week No` order by `Week No` ;

####KPI3 Weekwise Statistics of Departure of flights from Manchester####
Select `OriginCityName`, `DestCityName`, week(FlightDate,1) as `Week No`,count(*) AS `No. Of Flights`, 
round(count(`FlightDate`)/count(distinct(`FlightDate`)),2) as `Average`from data1 
where DestCityName="Manchester, NH"  group by `Week No`  order by `Week No`;

####KPI4:Total distance covered by N190AA on 20th January with Airtime as 50####
select `TailNum`, `AirTime`, `Distance` from data2 where `TailNum`="N190AA" AND `AirTime`=50;




 
 

  
 
  
  

