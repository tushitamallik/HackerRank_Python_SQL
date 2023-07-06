/*
1. Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. 
  Output one of the following statements for each record in the table:
    Equilateral: It's a triangle with  sides of equal length.
    Isosceles: It's a triangle with  sides of equal length.
    Scalene: It's a triangle with  sides of differing lengths.
    Not A Triangle: The given values of A, B, and C don't form a triangle.
*/

SELECT CASE 
WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle' 
WHEN A = B AND B = C THEN 'Equilateral' 
WHEN A = B OR B = C OR A = C THEN 'Isosceles' 
ELSE 'Scalene'
END 
FROM TRIANGLES;
-----------------------------------------------------------------------------------------------------------------

/*
2. Generate the following two result sets:

Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of 
each profession as a parenthetical (i.e.: enclosed in parentheses). 
For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).

Query the number of ocurrences of each occupation in OCCUPATIONS. 
Sort the occurrences in ascending order, and output them in the following format:
          There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and 
[occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], 
they should be ordered alphabetically.
*/

SELECT concat(NAME,concat("(",concat(substr(OCCUPATION,1,1),")"))) 
FROM OCCUPATIONS ORDER BY NAME ASC;

SELECT "There are a total of ", count(OCCUPATION), concat(lower(occupation),"s.") 
FROM OCCUPATIONS GROUP BY OCCUPATION ORDER BY count(OCCUPATION), OCCUPATION ASC;
-----------------------------------------------------------------------------------------------------------------

/*
3. Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its 
corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.
Note: Print NULL when there are no more names corresponding to an occupation.
*/

set @r1=0, @r2=0, @r3=0, @r4=0;
select min(Doctor), min(Professor), min(Singer), min(Actor)
from(select case when Occupation="Doctor" then (@r1:=@r1+1) 
  when Occupation="Professor" then (@r2:=@r2+1) 
  when Occupation="Singer" then (@r3:=@r3+1) 
  when Occupation="Actor" then (@r4:=@r4+1) end as RowNumber,
case when Occupation="Doctor" then Name end as Doctor,
case when Occupation="Professor" then Name end as Professor,
case when Occupation="Singer" then Name end as Singer,
case when Occupation="Actor" then Name end as Actor from OCCUPATIONS order by Name
) Temp group by RowNumber;
-----------------------------------------------------------------------------------------------------------------

/*
4. You are given a table, BST, containing two columns: N and P, 
   where N represents the value of a node in Binary Tree, and P is the parent of N.

    Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:
      Root: If node is root node.
      Leaf: If node is leaf node.
      Inner: If node is neither root nor leaf node.
*/

SELECT N, IF(P IS NULL,"Root",IF((SELECT COUNT(*) FROM BST WHERE P=B.N)>0,"Inner","Leaf")) FROM BST AS B ORDER BY N;
-----------------------------------------------------------------------------------------------------------------

/*
5. Amber's conglomerate corporation just acquired some new companies. 
   Each of the companies follows this hierarchy: 
    Given the table schemas below, write a query to print the company_code, founder name, 
    total number of lead managers, total number of senior managers, total number of managers, and 
    total number of employees. Order your output by ascending company_code.
*/

select c.company_code, c.founder, count(distinct lm.lead_manager_code), count(distinct sm.senior_manager_code), 
  count(distinct m.manager_code), count(distinct e.employee_code) 
from Company c, Lead_Manager lm, Senior_Manager sm, Manager m, Employee e
where c.company_code = lm.company_code 
and lm.lead_manager_code = sm.lead_manager_code 
and sm.senior_manager_code = m.senior_manager_code 
and m.manager_code = e.manager_code 
group by c.company_code, c.founder
order by c.company_code;
-----------------------------------------------------------------------------------------------------------------
