---1
SELECT t.first_name,t.last_name ,c.country_name FROM tourists t
JOIN countries c ON t.country_id = c.id;

---2
SELECT tourists.first_name,tourists.last_name ,tours.tour_name FROM tourists 
JOIN tours ON tourists.tour_id = tours.id;

---3
SELECT tourists.first_name,tourists.last_name ,tours.tour_name FROM tourists 
LEFT JOIN tours ON tourists.tour_id = tours.id;

---4
SELECT tourists.first_name,tourists.last_name ,tours.tour_name FROM tourists 
FULL JOIN tours ON tourists.tour_id = tours.id;

---5
SELECT tourists.first_name,tourists.last_name ,tours.tour_name FROM tourists 
LEFT JOIN tours ON tourists.tour_id = tours.id
WHERE tourists.tour_id IS NULL;

---6
SELECT tours.* ,tourists.first_name,tourists.last_name FROM tours 
LEFT JOIN tourists ON tours.id = tourists.tour_id
WHERE tourists.first_name IS NULL;

UPDATE tours 
SET start_date = start_date + INTERVAL '1 year',
	end_date = end_date + INTERVAL '1 year'
WHERE tour_name IN (SELECT tours.tour_name FROM tours 
LEFT JOIN tourists ON tours.id = tourists.tour_id
WHERE tourists.first_name IS NULL);

---7
SELECT tours.tour_name ,COUNT(*) AS null_tours_count FROM tours 
LEFT JOIN tourists ON tours.id = tourists.tour_id
WHERE tourists.first_name IS NULL
GROUP BY tours.tour_name;

---8
SELECT tourists.first_name ,tours.tour_name FROM tourists
CROSS JOIN tours;
-- SELECT tourists.first_name ,tours.tour_name FROM tours
-- CROSS JOIN tourists
-- ORDER BY tourists.first_name; (by names)
