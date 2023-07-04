/*
1.  Query all columns for all American cities in the CITY table with populations larger than 100000. 
The CountryCode for America is USA.
*/
select * from city where countrycode = 'USA' and population>100000;

------------------------------------------------------------------------------------------------------------
/*
2.  Query the NAME field for all American cities in the CITY table 
with populations larger than 120000. The CountryCode for America is USA.
*/
select name from city where countrycode='USA' and population>120000;

------------------------------------------------------------------------------------------------------------
/*
3.  Query all columns for a city in CITY with the ID 1661.
*/
select * from city where id=1661;

------------------------------------------------------------------------------------------------------------
/*
4. Query a list of CITY and STATE from the STATION table.
*/
select city, state from station;

------------------------------------------------------------------------------------------------------------
/*
5. Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee 
   having a salary greater than  per month who have been employees for less than  months. 
   Sort your result by ascending employee_id.
*/
select name from employee
where salary>2000 and months<10
order by employee_id ;

------------------------------------------------------------------------------------------------------------
/*
6. Write a query that prints a list of employee names 
   (i.e.: the name attribute) from the Employee table in alphabetical order.
*/
select name from employee 
order by name;

------------------------------------------------------------------------------------------------------------
/*
7. Query the Name of any student in STUDENTS who scored higher than 75 Marks. 
   Order your output by the last three characters of each name. 
   If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), 
   secondary sort them by ascending ID.
*/
select name 
from students
where marks>75
order by right(name,3),id;

------------------------------------------------------------------------------------------------------------
/*
8.  Query the list of CITY names from STATION that 
    do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '^[aeiou]'
AND CITY NOT REGEXP '[aeiou]$';

------------------------------------------------------------------------------------------------------------
/*
9.  Query the list of CITY names from STATION that 
    either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT RLIKE '^[aeiou]'
OR CITY NOT REGEXP '[aeiou]$';

------------------------------------------------------------------------------------------------------------
/*
10.  Query the list of CITY names from STATION that do not end with vowels. 
     Your result cannot contain duplicates.
*/
SELECT DISTINCT CITY FROM STATION WHERE CITY NOT REGEXP '[aeiou]$';

------------------------------------------------------------------------------------------------------------
/*
11.  Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) 
     as both their first and last characters. Your result cannot contain duplicates.
*/
select distinct city from station
where (city like 'a%'
or city like 'e%'
or city like 'i%'
or city like 'o%'
or city like 'u%')
and
(
city like '%a'
or city like '%e'
or city like '%i'
or city like '%o'
or city like '%u'
)

------------------------------------------------------------------------------------------------------------
/*
12.  Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. 
     Your result cannot contain duplicates.
*/
SELECT DISTINCT city FROM station WHERE city LIKE "%a" OR city LIKE "%e" OR city LIKE "%i" OR city LIKE "%o" OR city LIKE "%u";

------------------------------------------------------------------------------------------------------------
/*
13.  Query the two cities in STATION with the shortest and longest CITY names, 
     as well as their respective lengths (i.e.: number of characters in the name). 
     If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
*/
select city c, length(city) l
from   station
order by l desc, c asc
limit 1;

select city c, length(city) l
from   station
order by l asc, c asc
limit 1;

------------------------------------------------------------------------------------------------------------
/*
14.  Find the difference between the total number of CITY entries 
     in the table and the number of distinct CITY entries in the table.
*/
select count(city) - count(distinct city) from station;

------------------------------------------------------------------------------------------------------------
/*
15.  Query a list of CITY names from STATION for cities that have an even ID number. 
     Print the results in any order, but exclude duplicates from the answer.
*/
select unique city from station where mod(id,2)=0;

------------------------------------------------------------------------------------------------------------
