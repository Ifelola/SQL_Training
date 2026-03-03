-- =============================================-- Developer:		Ifelola   Ajibola-- Create date:     02-03-2026-- Description:	    This code is to create Queries that will answer--                  the Netflixbusiness Question-- =============================================

--Assignment - 
Select *
From [dbo].[NetflixBusiness]
-- NetflixBusiness Data Analysis using SQL

-- 15 business problems
--Summary
-- 1. Count the number of Movies vs TV Shows
SELECT type, COUNT(*) AS total_count
FROM NetflixBusiness
GROUP BY type

-- 2. Find the most common rating for movies and TV showsSELECT type, rating, COUNT(*) AS rating_count

SELECT type, rating, COUNT(*) AS rating_count
FROM NetflixBusiness
GROUP BY type, rating
ORDER BY rating_count DESC;

WITH RatingCTE AS (
    SELECT type, rating, COUNT(*) AS rating_count,
           ROW_NUMBER() OVER (PARTITION BY type ORDER BY COUNT(*) DESC) AS rn
    FROM NetflixBusiness
    GROUP BY type, rating
)
SELECT type, rating, rating_count
FROM RatingCTE
WHERE rn = 1;

-- 3. List all movies released in a specific year 2020
SELECT *
FROM NetflixBusiness
WHERE type = 'Movie'
AND release_year = 2020;


-- 4. Find the top 5 countries with the most content on NetflixBusiness
SELECT TOP 5 country, COUNT(*) AS total_content
FROM NetflixBusiness
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_content DESC

-- 5. Identify the longest movie
SELECT TOP 1 *
FROM NetflixBusiness
WHERE type = 'Movie'
ORDER BY CAST(LEFT(duration, CHARINDEX(' ', duration)-1) AS INT) DESC;


-- 6. Find content that was added in the last 5 years

SELECT *
FROM NetflixBusiness
WHERE YEAR(date_added) >= YEAR(GETDATE()) - 5;

-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!  

SELECT *
FROM NetflixBusiness
WHERE director = 'Rajiv Chilaka';

-- 8. List all TV shows with more than 5 seasons
SELECT *
FROM NetflixBusiness
WHERE type = 'TV Show'
AND CAST(LEFT(duration, CHARINDEX(' ', duration)-1) AS INT) > 5;

-- 9. Count the number of content items in each genre
SELECT listed_in, COUNT(*) AS total_count
FROM NetflixBusiness
GROUP BY listed_in
ORDER BY total_count DESC;


-- 10. Find each year and the average numbers of content release by India on NetflixBusiness. 
SELECT release_year, COUNT(*) AS total_releases
FROM NetflixBusiness
WHERE country LIKE '%India%'
GROUP BY release_year
ORDER BY release_year;

-- return top 5 year with highest avg content release !
SELECT TOP 5 release_year, COUNT(*) AS total_releases
FROM NetflixBusiness
WHERE country LIKE '%India%'
GROUP BY release_year
ORDER BY total_releases DESC;

-- 11. List all movies that are documentaries
SELECT *
FROM NetflixBusiness
WHERE listed_in LIKE '%Documentary%';

-- 12. Find all content without a director

SELECT *
FROM NetflixBusiness
WHERE director IS NULL;

-- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years!

SELECT *
FROM NetflixBusiness
WHERE cast LIKE '%Salman Khan%'
AND release_year >= YEAR(GETDATE()) - 10;

-- 14. Find the top 10 actors who have appeared in the highest number of movies produced in India.
SELECT TOP 10 cast, COUNT(*) AS movie_count
FROM NetflixBusiness
WHERE country LIKE '%India%'
AND type = 'Movie'
GROUP BY cast
ORDER BY movie_count DESC;

--Excluding Null
SELECT TOP 10 cast, COUNT(*) AS movie_count
FROM NetflixBusiness
WHERE country LIKE '%India%'
AND type = 'Movie'
AND cast IS NOT NULL
GROUP BY cast
ORDER BY movie_count DESC;


-- 15: Categorize the content based on the presence of the keywords 'kill' and'violence' in the description field. 
 --Label content containing these keywords as 'Bad' and all other content as 'Good'. Count how many items fall into each category.
SELECT 
    CASE 
        WHEN description LIKE '%kill%' 
          OR description LIKE '%violence%' 
        THEN 'Bad'
        ELSE 'Good'
    END AS Content_Category,
    COUNT(*) AS total_count
FROM NetflixBusiness
GROUP BY 
    CASE 
        WHEN description LIKE '%kill%' 
          OR description LIKE '%violence%' 
        THEN 'Bad'
        ELSE 'Good'
    END;



