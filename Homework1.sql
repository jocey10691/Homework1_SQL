#Homework Assignment #1 

#1 Which destination in the flights database is the furthest distance away, based on information in the flights table. Show the SQL query(s) that support your conclusion.

select distinct origin, dest, distance
from flights
order by distance desc; 

#From JFK to HNL, there are 4,983 miles making this the longest distinct combination. 

#2 What are the different numbers of engines in the planes table? For each number of engines, which aircraft have the most number of seats? Show the SQL statement(s) that support your result.

select * 
from planes; 

select distinct engines
from planes;

#There can be 1,2,3,or 4 engines on a plane.  

(select model, engines, seats from planes where engines=1 order by seats desc limit 1)
union all 
(select model, engines, seats from planes where engines=2 order by seats desc limit 1)
union all 
(select model, engines, seats from planes where engines=3 order by seats desc limit 1)
union all
(select model, engines, seats from planes where engines=4 order by seats desc limit 1); 

# Model: OTTER DHC-3 has 1 engine and 16 seats
#Model: 777-222 has 2 engines and 400 seats
#Model: A330-223 has 3 engines and 379 seats
#Model 747-451 has 4 engines and 450 seats 


#3. Show the total number of flights. 
select count(flight) as FlightCount
from flights;

#336,776 flights 

#4. Show the total number of flights by airline (carrier).

select carrier, count(flight)as FlightCount
from flights
group by carrier;

#Carrier	FlightCount
#9E	18460
#AA	32729
#AS	714
#B6	54635
#DL	48110
#EV	54173
#F9	685
#FL	3260
#HA	342
#MQ	26397
#OO	32
#UA	58665
#US	20536
#VX	5162
#WN	12275
#YV	601

#5. Show all of the airlines, ordered by number of flights in descending order.
select carrier, count(flight)as FlightCount
from flights
group by carrier
order by FlightCount desc;

#carrier	FlightCount
#UA	58665
#B6	54635
#EV	54173
#DL	48110
#AA	32729
#MQ	26397
#US	20536
#9E	18460
#WN	12275
#VX	5162
#FL	3260
#AS	714
#F9	685
#YV	601
#HA	342
#OO	32

#6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.
select carrier, count(flight)as FlightCount
from flights
group by carrier
order by FlightCount desc
limit 5;

#carrier	FlightCount
#UA	58665
#B6	54635
#EV	54173
#DL	48110
#AA	32729

#7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of
#flights in descending order.

select carrier, count(flight)as FlightCount
from flights
where distance >=1000
group by carrier
order by FlightCount desc
limit 5;

#carrier	FlightCount
#UA	41135
#B6	30022
#EV	28096
#DL	23583
#AA	6248

#8. Create a question using flights that requires aggregation and solve it. 
#Question: Assuming that arr_delay shows how many minutes a flight was delayed (positive numbers indicate a delay and negative numbers show that a flight arrived early), determine which carrier had the lowest average delay time in 2013. 
select carrier,avg(arr_delay) as AvgDelay
from flights
where year=2013
group by carrier
order by AvgDelay;
#(limit 1)

#AS has the lowest average of -9.3909 meaning they showed up on average about 9 minutes early to their flights.
#I'm not sure I made the right assumptions about this field, but I carried them through for the problem. 