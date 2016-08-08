Twitter Word Count Application README.txt

Run Instructions:
1. Start AWS EC2 Instance using the "UCB MIDS W205 EX2-FULL" public AMI. This AMI already has Streamparse installed and configured. 
2. Switch to working user: su - w205
3. Start postgres: /data/start_postgres.sh
4. Log into postgres: psql -U postgres
5. Create required database: create database tcount;
6. Use new database: \c tcount
7. Create required table: CREATE TABLE Tweetwordcount (word TEXT PRIMARY KEY NOT NULL, count INT NOT NULL);
8. Exit postgres: \q
9. Clone this repository into the newly configured EC2 instance
10. Navigate into the application directory (replace ~ with the clone directory if placed in directory other than root): cd ~/mids-projects/w205_exercise_2/EXTweetwordcount
11. Default configurations are included. Simply run the application using: sparse run
12. The application will run indefinitely. Cancel the stream using: ctrl + c