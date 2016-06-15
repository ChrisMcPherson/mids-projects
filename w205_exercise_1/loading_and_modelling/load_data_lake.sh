su - w205
mkdir -p /home/w205/exercise_1_data
cd exercise_1_data

mv "Measure Dates.csv" measures.csv
mv "Hospital General Information.csv" hospitals.csv
mv "Timely and Effective Care - Hospital.csv" effective_care_hospital.csv
mv "Readmissions and Deaths - Hospital.csv" readmissions_hospital.csv
mv "hvbp_hcahps_05_28_2015.csv" survey_responses.csv

hdfs dfs -mkdir /user/w205/hospital_compare/

hdfs dfs -put measures.csv /user/w205/hospital_compare
hdfs dfs -put hospitals.csv /user/w205/hospital_compare
hdfs dfs -put readmissions_hospital.csv /user/w205/hospital_compare
hdfs dfs -put survey_responses.csv /user/w205/hospital_compare
hdfs dfs -put effective_care_hospital.csv /user/w205/hospital_compare