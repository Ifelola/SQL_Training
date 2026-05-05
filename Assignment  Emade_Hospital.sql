
DROP TABLE IF EXISTS EMADE_HOSPITAL;

create table EMADE_HOSPITAL 
( emp_id int
, action varchar(10)
, time datetime
);

insert into EMADE_HOSPITAL values ('1', 'in', '2019-12-22 09:00:00');
insert into EMADE_HOSPITAL values ('1', 'out', '2019-12-22 09:15:00');
insert into EMADE_HOSPITAL values ('2', 'in', '2019-12-22 09:00:00');
insert into EMADE_HOSPITAL values ('2', 'out', '2019-12-22 09:15:00');
insert into EMADE_HOSPITAL values ('2', 'in', '2019-12-22 09:30:00');
insert into EMADE_HOSPITAL values ('3', 'out', '2019-12-22 09:00:00');
insert into EMADE_HOSPITAL values ('3', 'in', '2019-12-22 09:15:00');
insert into EMADE_HOSPITAL values ('3', 'out', '2019-12-22 09:30:00');
insert into EMADE_HOSPITAL values ('3', 'in', '2019-12-22 09:45:00');
insert into EMADE_HOSPITAL values ('4', 'in', '2019-12-22 09:45:00');
insert into EMADE_HOSPITAL values ('5', 'out', '2019-12-22 09:40:00');



-- Write a SQL query to find out the number of people present inside the EMADE_HOSPITAL


Select *
From EMADE_HOSPITAL

WITH LatestAction AS (
    SELECT 
        emp_id,
        action,
        time,
        ROW_NUMBER() OVER (PARTITION BY emp_id ORDER BY time DESC) AS rn
    FROM EMADE_HOSPITAL
)

SELECT COUNT(*) AS people_inside
FROM LatestAction
WHERE rn = 1
AND action = 'in';




WITH latest_action AS (
    SELECT 
        emp_id,
        action,
        ROW_NUMBER() OVER (PARTITION BY emp_id ORDER BY time DESC) AS rn
    FROM EMADE_HOSPITAL
)
SELECT COUNT(*) AS people_present
FROM latest_action
WHERE rn = 1 AND action = 'in';


Select *
From EMADE_HOSPITAL

