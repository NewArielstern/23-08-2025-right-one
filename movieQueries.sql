---1
SELECT COUNT(movie_name) AS movie_count FROM movies;

---2
SELECT year,SUM(revenue) AS total_revenue FROM movies
GROUP BY year
ORDER BY year;

---3
SELECT genre,AVG(revenue) AS avg_revenue FROM movies
GROUP BY genre
order by genre;
-- SELECT AVG(revenue) FROM movies
-- WHERE genre like 'Action';

---4
SELECT genre,language,AVG(revenue) AS avg_revenue FROM movies
GROUP BY genre,language
order by genre;

---5
SELECT language,COUNT(movie_name) AS movie_count FROM movies
GROUP BY language
order by movie_count ASC LIMIT 1 ;

---6
SELECT country,COUNT(movie_name) AS movie_count FROM movies
GROUP BY country
order by movie_count DESC LIMIT 1 ;

---7
SELECT genre, COUNT(movie_name) AS movie_count FROM movies
GROUP BY genre 
HAVING COUNT(movie_name) = 2
ORDER BY genre;

---8
SELECT year, SUM(revenue) AS total_revenue FROM movies
GROUP BY year 
HAVING SUM(revenue) > 1000
ORDER BY year;

---9
SELECT language, COUNT(movie_name) AS movie_count FROM movies
GROUP BY language 
HAVING COUNT(movie_name) > 2
ORDER BY language;
