--Are average scores for hospital quality or procedural variability correlated with patient survey responses?

SELECT  CORR(scores.score_std_dev, surveys.survey_score) AS proc_var_survey_corr
	, CORR(scores.average_score, surveys.survey_score) AS proc_var_survey_corr
FROM (
	SELECT sub.hospital_id
		, VARIANCE(sub.average_score) AS score_variation
		, STDDEV_POP(sub.average_score) AS score_std_dev
		, SUM(total_score) AS total_score
		, SUM(total_score)/SUM(total_sample) AS average_score
		, SUM(hospital_count) AS hospital_count
	FROM (
		SELECT proc.hospital_id
			, proc.measure_name
			, SUM(proc.score) AS total_score
			, SUM(proc.sample) AS total_sample
			, SUM(proc.score)/SUM(proc.sample) AS average_score
			, COUNT(DISTINCT proc.hospital_id) AS hospital_count
		FROM procedures_transformed AS proc
		INNER JOIN hospitals_transformed AS hos ON proc.hospital_id = hos.hospital_id
		GROUP BY proc.hospital_id
			, proc.measure_name
			, hos.state
		HAVING hos.state NOT IN ('GU','VI','AS','MP','PR','VI')
	) sub
	GROUP BY sub.hospital_id
) scores
INNER JOIN (
	SELECT hospital_id
		, SUM((hosp_comm_score + hos_rsp_score + hos_cln_score + hos_achv_score)/4) AS survey_score
	FROM surveys_transformed
	GROUP BY hospital_id
) surveys ON scores.hospital_id = surveys.hospital_id;

GROUP BY scores.hospital_id
ORDER BY survey_corr DESC
LIMIT 100;

