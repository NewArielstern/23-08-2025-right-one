---1
CREATE TABLE tourists_trip(
	tourist_id INTEGER REFERENCES tourists(id),
	tour_id INTEGER REFERENCES tours(id),	
	PRIMARY KEY (tourist_id ,tour_id));

INSERT INTO tourists_trip(tourist_id ,tour_id) VALUES 
(1,2),
(2,3),
(3,4),
(3,6),
(3,7),
(5,9),
(6,7),
(2,1);

-- SELECT tourists.first_name,tourists_trip.* FROM tourists
-- JOIN tourists_trip ON tourists.id = tourists_trip.tourist_id;

---2
CREATE OR REPLACE FUNCTION get_revenue_per_year(year_t INTEGER)
RETURNS TABLE(year_check INTEGER,total_revenue REAL)
LANGUAGE plpgsql AS
$$
	BEGIN
		RETURN QUERY
		SELECT year AS year_check  ,SUM(revenue) AS total_revenue FROM movies
		WHERE year = year_t
		GROUP BY year
		ORDER BY year;
	END;
$$;
DROP FUNCTION IF EXISTS get_revenue_per_year(INTEGER);
SELECT * FROM get_revenue_per_year(2022);
