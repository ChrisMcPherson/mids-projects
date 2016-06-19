--What states are models of high-quality care?

SELECT hos.state
	, SUM(proc.score) AS total_score
	, SUM(proc.score)/SUM(proc.sample) AS average_score
	, MIN(proc.score) AS min_score
	, MAX(proc.score) AS max_score
	, COUNT(*) AS proc_count
	, COUNT(DISTINCT hos.hospital_id) AS hospital_count
FROM hospitals_transformed AS hos
INNER JOIN procedures_transformed AS proc ON hos.hospital_id = proc.hospital_id
GROUP BY hos.state
HAVING hos.state NOT IN ('GU','VI','AS','MP','PR','VI')
ORDER BY average_score DESC
LIMIT 10;
