DROP TABLE IF EXISTS fitness;

CREATE TABLE fits (

  id SERIAL PRIMARY KEY,
  first_name VARCHAR(25) NULL,
  age	 NUMERIC NULL,
  gender VARCHAR(7) NULL,
  experience  NUMERIC NULL, 
  date	 DATE NULL,
  title  VARCHAR(50) NULL,
  body  TEXT NULL,
  file VARCHAR(100) NULL
);


INSERT INTO fits (first_name, age, gender, experience, date, title, body) VALUES ('Ricky' , '27' , 'male' , '1 year','09/05/2017', 'diet' , 'how to eat healthy');
INSERT INTO fits (first_name, age, gender, experience, date,  title , body) VALUES ('first name', 'age' , 'gender' , 'experience', 'date' , 'title' , 'Body text 2');

