--The following queries were run to identify all unique values of the survey response columns
--That information went into the case statement of the transformation to output a double
--instead of a string.

--SELECT DISTINCT nurse_comm_score 
--FROM survey_responses;

--SELECT DISTINCT doc_comm_score 
--FROM survey_responses;

--SELECT DISTINCT med_comm_score 
--FROM survey_responses;

--SELECT DISTINCT dis_comm_score 
--FROM survey_responses;

--SELECT DISTINCT pain_mgmt_score 
--FROM survey_responses;

--SELECT DISTINCT hos_rsp_score 
--FROM survey_responses;

--SELECT DISTINCT hos_cln_q_score 
--FROM survey_responses;

--SELECT DISTINCT hcahps_base_score 
--FROM survey_responses;


CREATE TABLE IF NOT EXISTS surveys_transformed
STORED AS PARQUET
AS
SELECT sub.survey_id,
	sub.hospital_id,
	(sub.nurse_comm_score + sub.doc_comm_score + sub.med_comm_score + sub.dis_comm_score)/4 AS hosp_comm_score,
	sub.pain_mgmt_score,
	sub.hos_rsp_score,
	sub.hos_cln_score,
	sub.hos_achv_score
FROM (
	SELECT row_number() over () as survey_id
		, hospital_id
		, CASE 
			WHEN nurse_comm_score = '0 out of 10' THEN 0
			WHEN nurse_comm_score = '1 out of 10' THEN 0.1
			WHEN nurse_comm_score = '2 out of 10' THEN 0.2
			WHEN nurse_comm_score = '3 out of 10' THEN 0.3
			WHEN nurse_comm_score = '4 out of 10' THEN 0.4
			WHEN nurse_comm_score = '5 out of 10' THEN 0.5
			WHEN nurse_comm_score = '6 out of 10' THEN 0.6
			WHEN nurse_comm_score = '7 out of 10' THEN 0.7
			WHEN nurse_comm_score = '8 out of 10' THEN 0.8
			WHEN nurse_comm_score = '9 out of 10' THEN 0.9
			WHEN nurse_comm_score = '10 out of 10' THEN 1.0
		  	ELSE 0
		  END AS nurse_comm_score
		, CASE 
			WHEN doc_comm_score = '0 out of 10' THEN 0
			WHEN doc_comm_score = '1 out of 10' THEN 0.1
			WHEN doc_comm_score = '2 out of 10' THEN 0.2
			WHEN doc_comm_score = '3 out of 10' THEN 0.3
			WHEN doc_comm_score = '4 out of 10' THEN 0.4
			WHEN doc_comm_score = '5 out of 10' THEN 0.5
			WHEN doc_comm_score = '6 out of 10' THEN 0.6
			WHEN doc_comm_score = '7 out of 10' THEN 0.7
			WHEN doc_comm_score = '8 out of 10' THEN 0.8
			WHEN doc_comm_score = '9 out of 10' THEN 0.9
			WHEN doc_comm_score = '10 out of 10' THEN 1.0
		  	ELSE 0
		  END AS doc_comm_score
		, CASE 
			WHEN med_comm_score = '0 out of 10' THEN 0
			WHEN med_comm_score = '1 out of 10' THEN 0.1
			WHEN med_comm_score = '2 out of 10' THEN 0.2
			WHEN med_comm_score = '3 out of 10' THEN 0.3
			WHEN med_comm_score = '4 out of 10' THEN 0.4
			WHEN med_comm_score = '5 out of 10' THEN 0.5
			WHEN med_comm_score = '6 out of 10' THEN 0.6
			WHEN med_comm_score = '7 out of 10' THEN 0.7
			WHEN med_comm_score = '8 out of 10' THEN 0.8
			WHEN med_comm_score = '9 out of 10' THEN 0.9
			WHEN med_comm_score = '10 out of 10' THEN 1.0
		  	ELSE 0
		  END AS med_comm_score
		, CASE 
			WHEN dis_comm_score = '0 out of 10' THEN 0
			WHEN dis_comm_score = '1 out of 10' THEN 0.1
			WHEN dis_comm_score = '2 out of 10' THEN 0.2
			WHEN dis_comm_score = '3 out of 10' THEN 0.3
			WHEN dis_comm_score = '4 out of 10' THEN 0.4
			WHEN dis_comm_score = '5 out of 10' THEN 0.5
			WHEN dis_comm_score = '6 out of 10' THEN 0.6
			WHEN dis_comm_score = '7 out of 10' THEN 0.7
			WHEN dis_comm_score = '8 out of 10' THEN 0.8
			WHEN dis_comm_score = '9 out of 10' THEN 0.9
			WHEN dis_comm_score = '10 out of 10' THEN 1.0
		  	ELSE 0
		  END AS dis_comm_score
		, CASE 
			WHEN pain_mgmt_score = '0 out of 10' THEN 0
			WHEN pain_mgmt_score = '1 out of 10' THEN 0.1
			WHEN pain_mgmt_score = '2 out of 10' THEN 0.2
			WHEN pain_mgmt_score = '3 out of 10' THEN 0.3
			WHEN pain_mgmt_score = '4 out of 10' THEN 0.4
			WHEN pain_mgmt_score = '5 out of 10' THEN 0.5
			WHEN pain_mgmt_score = '6 out of 10' THEN 0.6
			WHEN pain_mgmt_score = '7 out of 10' THEN 0.7
			WHEN pain_mgmt_score = '8 out of 10' THEN 0.8
			WHEN pain_mgmt_score = '9 out of 10' THEN 0.9
			WHEN pain_mgmt_score = '10 out of 10' THEN 1.0
		  	ELSE 0
		  END AS pain_mgmt_score
		, CASE 
			WHEN hos_rsp_score = '0 out of 10' THEN 0
			WHEN hos_rsp_score = '1 out of 10' THEN 0.1
			WHEN hos_rsp_score = '2 out of 10' THEN 0.2
			WHEN hos_rsp_score = '3 out of 10' THEN 0.3
			WHEN hos_rsp_score = '4 out of 10' THEN 0.4
			WHEN hos_rsp_score = '5 out of 10' THEN 0.5
			WHEN hos_rsp_score = '6 out of 10' THEN 0.6
			WHEN hos_rsp_score = '7 out of 10' THEN 0.7
			WHEN hos_rsp_score = '8 out of 10' THEN 0.8
			WHEN hos_rsp_score = '9 out of 10' THEN 0.9
			WHEN hos_rsp_score = '10 out of 10' THEN 1.0
		  	ELSE 0
		  END AS hos_rsp_score
		, CASE 
			WHEN hos_cln_q_score = '0 out of 10' THEN 0
			WHEN hos_cln_q_score = '1 out of 10' THEN 0.1
			WHEN hos_cln_q_score = '2 out of 10' THEN 0.2
			WHEN hos_cln_q_score = '3 out of 10' THEN 0.3
			WHEN hos_cln_q_score = '4 out of 10' THEN 0.4
			WHEN hos_cln_q_score = '5 out of 10' THEN 0.5
			WHEN hos_cln_q_score = '6 out of 10' THEN 0.6
			WHEN hos_cln_q_score = '7 out of 10' THEN 0.7
			WHEN hos_cln_q_score = '8 out of 10' THEN 0.8
			WHEN hos_cln_q_score = '9 out of 10' THEN 0.9
			WHEN hos_cln_q_score = '10 out of 10' THEN 1.0
		  	ELSE 0
		  END AS hos_cln_score
		, cast(hcahps_base_score as int)/90 AS hos_achv_score
	FROM survey_responses
) sub;