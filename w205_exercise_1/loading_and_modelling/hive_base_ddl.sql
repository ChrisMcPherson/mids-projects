CREATE EXTERNAL TABLE IF NOT EXISTS procedures 
(	hospital_id int,
	hospital_name string,
	address string,
	city string,
	state string,
	zip string,
	county string,
	phone string,
	condition string,
	measure_id int,
	measure_name string,
	score int,
	sample int,
	footnote string,
	measure_st_dt string,
	measure_end_dt string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/procedures';

CREATE EXTERNAL TABLE IF NOT EXISTS survey_responses
(	hospital_id int,
	hospital_name string,
	address string,
	city string,
	state string,
	zip string,
	county string,
	nurse_comm_score string,
	q2 string,
	q3 string,
	doc_comm_score string,
	q5 string,
	q6 string,
	hos_rsp_score string,
	q8 string,
	q9 string,
	pain_mgmt_score string,
	q11 string,
	q12 string,
	med_comm_score string,
	q14 string,
	q15 string,
	hos_cln_q_score string,
	q17 string,
	q18 string,
	dis_comm_score string,
	q20 string,
	q21 string,
	hos_over_all_score string,
	q23 string,
	q24 string,
	hcahps_base_score int,
	hcahps_cons_score int
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys';

CREATE EXTERNAL TABLE IF NOT EXISTS hospitals 
(	hospital_id int,
	hospital_name string,
	address string,
	city string,
	state string,
	zip int,
	county string,
	phone string,
	hospital_type string,
	ownerwhip string,
	emergency_services string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';

CREATE EXTERNAL TABLE IF NOT EXISTS measures
(	measure_name string,
	measure_id string,
	measure_st_qtr string,
	measure_st_dt string,
	measure_end_qtr string,
	measure_end_dt string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures';

CREATE EXTERNAL TABLE IF NOT EXISTS readmissions
(	provider_id int,
	hospital_name string,
	address string,
	city string,
	state string,
	zip string,
	county string,
	phone string,
	measure_name string,
	measure_id int,
	comp_to_national string,
	denominator int,
	score int,
	lower_estimate double,
	higher_estimate double,
	footnote string,
	measure_st_dt string,
	measure_end_dt string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';