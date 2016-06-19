--Which procedures have the greatest variability between hospitals?
SELECT sub.measure_name
	, VARIANCE(sub.average_score) AS score_variation
	, STDDEV_POP(sub.average_score) AS score_std_dev
	, SUM(total_score) AS total_score
	, SUM(hospital_count) AS hospital_count
FROM (
	SELECT proc.hospital_id
		, proc.measure_name
		, SUM(proc.score) AS total_score
		, SUM(proc.score)/SUM(proc.sample) AS average_score
		, COUNT(DISTINCT proc.hospital_id) AS hospital_count
	FROM procedures_transformed AS proc
	INNER JOIN hospitals_transformed AS hos ON proc.hospital_id = hos.hospital_id
	GROUP BY proc.hospital_id
		, proc.measure_name
		, hos.state
	HAVING hos.state NOT IN ('GU','VI','AS','MP','PR','VI')
) sub
GROUP BY sub.measure_name
ORDER BY score_variation DESC
LIMIT 10;

