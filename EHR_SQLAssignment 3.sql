-- Assignment 3 
--1. Lists out number of patients in descending order
--Does not include Quincy
--Must have at least 2 patients from that city

Select *
From [dbo].[EHR_patientsSSIS]


Select City,Count (ID) As Patients_Count
From [dbo].[EHR_patientsSSIS]
Where City <> 'Quincy'
Group by City
Having Count (ID) >= 2
Order By Patients_Count Desc



2.To find out
the Top 10 patients with the most visits to the hospital

SELECT Top 10 PATIENT,
COUNT(ID) AS total_visits
FROM [dbo].[EHR_encountersSSIS]
GROUP BY PATIENT
ORDER BY total_visits DESC

SELECT 
    p.FIRST,
    p.LAST,
    COUNT(*) AS total_visits
FROM [dbo].[EHR_encountersSSIS] e
JOIN [dbo].[EHR_patientsSSIS] p 
    ON e.PATIENT = p.Id
GROUP BY p.Id, p.FIRST, p.LAST
ORDER BY total_visits DESC





3.To find out
the number of times patients from each city visited the hospital.

SELECT 
    p.CITY,
    COUNT(*) AS Total_visits
FROM [dbo].[EHR_encountersSSIS] e
JOIN [dbo].[EHR_patientsSSIS] p 
    ON e.PATIENT = p.Id
GROUP BY p.CITY
ORDER BY Total_visits DESC

Select *
from [dbo].[EHR_patientsSSIS]

4. To find out
the cities with up to 50 counts of emergency cases.

SELECT 
    p.CITY,
    COUNT(*) AS emergency_cases
FROM [dbo].[EHR_encountersSSIS] e
JOIN [dbo].[EHR_patientsSSIS] p 
    ON e.PATIENT = p.Id
WHERE e.ENCOUNTERCLASS = 'emergency'
GROUP BY p.CITY
HAVING COUNT(*) <= 50
ORDER BY emergency_cases DESC


5. Now to find
out the number of patients from Boston who came in 2020.

SELECT 
    COUNT(DISTINCT e.PATIENT) AS Total_patients
FROM [dbo].[EHR_encountersSSIS] e
JOIN [dbo].[EHR_patientsSSIS] p 
    ON e.PATIENT = p.Id
WHERE p.CITY = 'Boston'
  AND YEAR(e.START) = 2020



6.To find out
the top recurring conditions.

SELECT Top 10
    [REASONDESCRIPTION],
    COUNT(*) AS occurrence_count
FROM [dbo].[EHR_encountersSSIS] e
WHERE [REASONDESCRIPTION] IS NOT NULL
GROUP BY [REASONDESCRIPTION]
ORDER BY occurrence_count DESC


Select *
From [dbo].[EHR_encountersSSIS]

7. To find out
the month with the highest number of ambulatory cases since 2010.

  SELECT TOP 1
    YEAR(START) AS year,
    MONTH(START) AS month,
    COUNT(*) AS ambulatory_cases
FROM [dbo].[EHR_encountersSSIS] e
WHERE ENCOUNTERCLASS = 'ambulatory'
  AND START >= '2010-01-01'
GROUP BY YEAR(START), MONTH(START)
ORDER BY ambulatory_cases DESC


8.To find out
the month with the highest number of emergency cases since 2010.

SELECT Top 1
    YEAR(START) AS year,
    MONTH(START) AS month,
    COUNT(*) AS emergency_cases
FROM [dbo].[EHR_encountersSSIS] e
WHERE e.ENCOUNTERCLASS = 'emergency'
  AND e.START >= '2010-01-01'
GROUP BY YEAR(START), MONTH(START)
ORDER BY emergency_cases DESC



9. Now to find
out the Top 15 years with the most immunizations.

SELECT TOP 15
    YEAR(START) AS year,
    COUNT(*) AS immunization_count
FROM [dbo].[EHR_proceduresSSIS]
WHERE DESCRIPTION LIKE '%Immunization%'
   OR DESCRIPTION LIKE '%Vaccine%'
GROUP BY YEAR(START)
ORDER BY immunization_count DESC;



 
