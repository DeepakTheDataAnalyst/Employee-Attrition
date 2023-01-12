create database attrition;
use attrition;

select * 
from employee_attrition;

-- 1 Write a query to find the total no of employees.

select count(*)
from employee_attrition;

-- 2 Write a query to find the total of employees resign the company.

select count(*)
from employee_attrition
where Attrition = "Yes";

-- 3 list of the employee with highest environment satisfaction but under attrition

select   count(*)
from employee_attrition
where Attrition= "Yes"
and EnvironmentSatisfaction = "4 ‘Very High’";

-- 4  Identify the total no of male and female employees under attrition .

select count(*), Gender
from employee_attrition
where  attrition = "Yes"
group by gender;

-- 5 Write a query to find the list of depatments and  count of employee resigned from each dept.

select   department , count(attrition) 
from employee_attrition
where Attrition= "Yes"
group by Department;

-- 6  Identify the total no of male and female employees under attrition whose job satisfaction is low .

select count(*), Gender
from employee_attrition
where  attrition = "Yes"
and JobInvolvement = "1 ‘Low’"
group by gender ;

-- 7  Identify the total no employees attrition by there age.

select count(*), age
from employee_attrition
where  attrition = "Yes"
group by age;

-- 8 Write a query to find the number of employee by there department having less than  1 year in the company .

select Department, count(*)  
from employee_attrition
where YearsAtCompany <= 1 
and Attrition ="Yes"
group by department;

-- 9 Write an SQL query to find the details of employees under attrition having 5+ years of experience in between the age group of 27-35

select *
from employee_attrition
where age between 27 and 35
and totalworkingyears >= 5;

-- 10 Write an SQL query to fetch the details of employees having maximum and minimum salary working in different departments who received less than 13% salary hike.

select * ,
		PercentSalaryHike,
		max(MonthlyIncome) as Max_Salary,
        min(MonthlyIncome) as Min_Salary
from employee_attrition
group by department
having PercentSalaryHike < 13;

-- 11 Calculate the average monthly income of all the employees who worked more than 3 years whose education background is life sciences.

select EducationField,
		avg(MonthlyIncome) as Avg_Monthly_Income
from employee_attrition
where TotalWorkingYears > 3
and EducationField = "Life Sciences" ;

-- 12  Identify the total no of male and female employees under attrition whose marital status is married and haven't received promotion in the last 2 years.

select count(*), Gender
from employee_attrition
where  attrition = "Yes"
and maritalstatus = "Married" 
and YearsSinceLastPromotion = 2
group by gender;

-- 13 Identify the employee with max Performance rating but no promotion for 4 years and above.

select *
from employee_attrition
where PerformanceRating = (select max(PerformanceRating) from employee_attrition)
and YearsSinceLastPromotion >= 4 
and Attrition ="Yes" ;

-- 14 Identify the employees who have max and min % salary hike.

select EmployeeId,
		YearsAtCompany as `Total Years in Company`, 
		PerformanceRating as `Employee Ratings`, 
        YearsSinceLastPromotion as `Last Promotion (Years)`,
		max(PercentSalaryHike) as `Max % Salary Hike`, 
		min(PercentSalaryHike) as `Min % Salary Hike`
from employee_attrition
group by YearsAtCompany, PerformanceRating, YearsSinceLastPromotion
order by max(PercentSalaryHike) desc, min(PercentSalaryHike) asc;

-- 15 Count the no of employees from each department with minimum salary hike and are working more than 5 years in the company.

select Department, count(*)
from employee_attrition
where PercentSalaryHike = (select min(PercentSalaryHike) from employee_attrition)
and YearsAtCompany >= 5 
and Attrition = "Yes"
group by department;

-- 16 Identify the employees with maximum salary hike and are working less than 5 years in the company.

select *
from employee_attrition
where PercentSalaryHike = (select max(PercentSalaryHike) from employee_attrition)
and YearsAtCompany <= 5
and Attrition = "Yes";
