---1




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
