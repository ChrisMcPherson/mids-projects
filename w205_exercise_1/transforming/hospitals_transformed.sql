--The following query was run to identify all unique values of the emergency_services column
--That information went into the case statement of the transformation to output a boolean value
--instead of a string.

--SELECT DISTINCT emergency_services 
--FROM hospitals;

CREATE TABLE IF NOT EXISTS hospitals_transformed
STORED AS PARQUET
AS
SELECT hospital_id,
	hospital_name,
	address,
	city,
	state,
	zip,
	county,
	phone,
	hospital_type,
	ownerwhip,
	CASE 
		WHEN emergency_services = 'No' THEN 0
		ELSE 1
	END AS emergency_services
FROM hospitals;
	