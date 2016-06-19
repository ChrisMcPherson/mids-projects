--What hospitals are models of high-quality care? That is, which hospitals have the most consistently high scores for a variety
--of procedures. 

SELECT hos.hospital_id
	, hos.hospital_name
	, hos.hospital_type
	, hos.emergency_services
	, SUM(proc.score) AS total_score
	, SUM(proc.score)/SUM(proc.sample) AS average_score
	, MIN(proc.score) AS min_score
	, MAX(proc.score) AS max_score
	, COUNT(*) AS proc_count
FROM hospitals_transformed AS hos
INNER JOIN procedures_transformed AS proc ON hos.hospital_id = proc.hospital_id
GROUP BY hos.hospital_id
	, hos.hospital_name
	, hos.hospital_type
	, hos.emergency_services
ORDER BY average_score DESC
LIMIT 10;
