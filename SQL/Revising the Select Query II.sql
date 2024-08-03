/*
2.  Query the NAME field for all American cities in the CITY table 
with populations larger than 120000. The CountryCode for America is USA.
*/
select name from city where countrycode='USA' and population>120000;
