create database hr_management_db;
use hr_management_db;

-- cleaning
-- rename table
rename table `hr data` to hr_data;

-- rename column `ï»¿id` to id;
alter table hr_data rename column `ï»¿id` to id;

-- change date format and data type for birthdate
SET SQL_SAFE_UPDATES = 0;
select CASE WHEN birthdate LIKE '__-__-__' THEN STR_TO_DATE(birthdate, '%m-%d-%y') WHEN birthdate LIKE '%/%/%' THEN STR_TO_DATE(birthdate, '%m/%d/%Y') ELSE NULL END as 
ggg from hr_data;
update hr_data set birthdate = 
  CASE WHEN birthdate LIKE '__-__-__' THEN STR_TO_DATE(birthdate, '%m-%d-%y') WHEN birthdate LIKE '%/%/%' THEN STR_TO_DATE(birthdate, '%m/%d/%Y') ELSE NULL END;

ALTER TABLE hr_data CHANGE birthdate birth_date DATE;

select * from hr_data;
-- change date format and data type for hire_date
select CASE WHEN hire_date LIKE '__-__-__' THEN STR_TO_DATE(hire_date, '%m-%d-%y') WHEN hire_date LIKE '%/%/%' THEN STR_TO_DATE(hire_date, '%m/%d/%Y') ELSE NULL END as 
new_date from hr_data;

update hr_data set hire_date =  CASE WHEN hire_date LIKE '__-__-__' THEN STR_TO_DATE(hire_date, '%m-%d-%y') WHEN hire_date LIKE '%/%/%'THEN STR_TO_DATE(hire_date, '%m/%d/%Y') ELSE NULL 
END;
alter table hr_data modify hire_date Date;

select * from hr_data;
update hr_data set termdate = NULL where termdate = '';
update hr_data set termdate = replace(termdate, 'UTC', '');
SELECT terminate_date FROM hr_data WHERE STR_TO_DATE(terminate_date, '%Y-%m-%d %H:%i:%s') IS NULL AND TRIM(terminate_date) != '';

UPDATE hr_data SET terminate_date = STR_TO_DATE(terminate_date, '%Y-%m-%d %H:%i:%s') WHERE terminate_date IS NOT NULL AND trim(terminate_date) != '';


alter table hr_data change termdate termination_date datetime;
alter table hr_data
rename column terminated_date to terminate_date;
describe hr_data;

-- 1. What is the gender breakdown in the Company?
select gender, count(gender) as total from hr_data group by gender;
select * from hr_data;

-- 2.How many employees work remotely for each department?
select department, count(department) as remote_employees from hr_data where location = 'Remote' group by department order by 2;

-- 3.What is the distribution of employees who work remotely and HQ
select location, count(location) as total_employees from hr_data group by location;

-- 4.What is the race distribution in the Company?
select race, count(*) as total from hr_data group by race order by 2;

-- 5.What is the distribution of employee across different states?
select location_state, count(location_state) as distribution_count from hr_data group by 1 order by 2 desc;

-- 6. What is the number of employees whose employment has been terminated
select COUNT(terminate_date) as terminate_employees from hr_data where terminate_date < curdate();

-- 7. Who is/are the longest serving employee in the organization.
select concat(first_name," ",last_name) as employee_name, hire_date FROM hr_data order by 2  limit 5;

-- 8. Return the terminated employees by their race
select concat(first_name," ",last_name) as employee_name, race from hr_data where terminate_date < curdate();

-- 9. What is the age distribution in the Company?
-- fetch the age
select  floor(Datediff(current_date(), (birth_date)) / 365) as age from hr_data order by age desc;
-- add new column age
alter table hr_data
add column age int;
-- populate
select  floor(Datediff(current_date(), (birth_date)) / 365) as age from hr_data order by age desc;
set sql_safe_updates = 0;
update hr_data set age = floor(Datediff(current_date(), (birth_date)) / 365);
-- find the maximum and minimum age
select max(age),min(age) from hr_data;
select birth_date from hr_data where birth_date > curdate() order by 1 desc limit 1;
select date_sub(birth_date,interval 100 year) as updated_date from hr_data where birth_date between '2065-11-01' and '2069-12-12';
update hr_data set birth_date=date_sub(birth_date,interval 100 year) where birth_date between '2065-11-01' and '2069-12-12';
select * from hr_data;
select min(age) , max(age) from hr_data;

select case when age
between  21 and 30 then "0-20"  when age
 between 31 and 40 then "21-40" when age
 between 41 and 60 then "41-60" end as Age_Group, count(*) as Distribution from hr_data
 group by Age_Group order by 2 desc;

-- 10. How long have employee hire counts varied over time?
select year(hire_date) as hire_year, COUNT(*)  as hires from hr_data group by hire_year order by hire_year;
select case when year(hire_date) between 2000 and 2005 then '2000-2005' when year(hire_date) between 2006 and 2010 then '2006-2010'
when year(hire_date) between 2011 and 2015 then '2011-2015'  when year(hire_date) between 2016 and 2020 then '2016-2020' end as hires, count(*) as hire_count
from hr_data group by hires order by hire_count desc;

-- 11. What is the tenure distribution for each department?
select department, concat(floor(avg(datediff(current_date(),hire_date)/365)),' ','years') as tenure from hr_data group by department order by 2 desc;

-- 12. What is the average length of employment in the company?
select concat(floor(avg(datediff(current_date(),hire_date)/365)),' ','years') as tenure from hr_data;

