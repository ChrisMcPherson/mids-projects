--The following statement was run to verify that the measures table was not needed
--The measure names that are already in the procedures and readmissions tables were
--not substantially different to warrent joining to the measures table for retrieval

--SELECT p.measure_id
--	, p.measure_name
--	, m.measure_name 
--FROM procedures as p 
--INNER JOIN measures as m on p.measure_id = m.measure_id 
--WHERE p.measure_name <> m.measure_name
--LIMIT 10;

--The following statements were run to identify all textual elements that require 
--mapping to a valid integer value

--SELECT DISTINCT score
--FROM procedures;

--SELECT DISTINCT sample
--FROM procedures;

--statement
CREATE TABLE IF NOT EXISTS procedures_transformed
STORED AS PARQUET
AS
SELECT sub.procedure_id
	, sub.hospital_id
	, sub.condition
	, sub.measure_name
	, cast(sub.score as int) AS score
	, cast(sub.sample as int) AS sample
FROM (
	SELECT row_number() over () AS procedure_id
		, hospital_id
		, condition
		, measure_name
		, CASE 
			WHEN score = 'Not Available' THEN 0
			WHEN score = 'Low (0 - 19,999 patients annually)' THEN 10000
			WHEN score = 'High (40,000 - 59,999 patients annually)' THEN 50000
			WHEN score = 'Medium (20,000 - 39,999 patients annually)' THEN 30000
			WHEN score = 'Very High (60,000+ patients annually)' THEN 60000
			ELSE score 
		  END AS score
		, CASE 
			WHEN sample = 'Not Available' THEN 0
			ELSE sample
		  END AS sample
	FROM procedures
) AS sub;