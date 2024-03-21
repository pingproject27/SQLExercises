-- 1378. Replace Employee ID With The Unique Identifier
--   Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.
--   Difficulty: Easy

SELECT unique_id, name
FROM employees e
LEFT JOIN employeeuni eu
ON eu.id=e.id

-- 1068. Product Analysis I
--   Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
--   Difficulty: Easy

select product_name, year, price
from product p
inner join sales s
on s.product_id=p.product_id
  
-- 1581. Customer Who Visited But Didn't Make Any Transactions
--   Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.
--   Difficulty: Easy

select customer_id, count(1) count_no_trans  
from visits
where visit_id not in (select visit_id from transactions)
group by customer_id
  
-- 197. Rising Temperature
--   Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).
--   Difficulty: Easy

select td.id
from weather td
join weather yt
on td.recordDate  = date_add(yt.recordDate, interval 1 day)
and td.temperature > yt.temperature 

  
-- 1661. Average Time of Process per Machine
--   There is a factory website that has several machines each running the same number of processes. Write a solution to find the average time each machine takes to complete a process.
--   The time to complete a process is the 'end' timestamp minus the 'start' timestamp. The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.
--   The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.
--   Difficulty: Easy

select machine_id, round(avg(process_time),3) as processing_time
from
(
select start.machine_id, start.process_id, end_timestamp - start_timestamp process_time
from
(
select machine_id, process_id,timestamp start_timestamp
from activity
where activity_type ='start'
) start
,(
select machine_id, process_id,timestamp end_timestamp
from activity
where activity_type ='end'
) end
where start.machine_id=end.machine_id and start.process_id=end.process_id
) a
group by machine_id


-- 577. Employee Bonus
--   Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.
--   Difficulty: Easy

select e.name, b.bonus 
from employee e
left outer join bonus b
on e.empid=b.empid
where bonus < 1000 or bonus is null
  
-- 1280. Students and Examinations
--   Write a solution to find the number of times each student attended each exam.
--   Return the result table ordered by student_id and subject_name.
--   Difficulty: Easy

select s.student_id, s.student_name, su.subject_name, count(e.student_id) as  attended_exams
from students s
cross join subjects su
left join examinations e
on s.student_id=e.student_id
and su.subject_name=e.subject_name
group by 1,2,3
order by 1,2
  
-- 570. Managers with at Least 5 Direct Reports
--   Write a solution to find managers with at least five direct reports.
--   Difficulty: Medium
  
select m.name
from employee e
join employee m
on e.managerid=m.id 
group by m.name, m.id
having count(1) >= 5
  
-- 1934. Confirmation Rate
--   The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages. The confirmation rate of a user that did not request any confirmation messages is 0. Round the confirmation rate to two decimal places.
--   Write a solution to find the confirmation rate of each user.
--   Difficulty: Medium

select s.user_id
, round(
   case 
    when sum(case action when 'confirmed' then 1 else 0 end) = 0 then 0
    else sum(case action when 'confirmed' then 1 else 0 end) / count(c.user_id) :: numeric
    end 
,2)
as confirmation_rate
from signups s
left join confirmations c
using (user_id)
group by 1
