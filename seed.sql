DROP TABLE IF EXISTS fitness;

CREATE TABLE fits (

  id SERIAL PRIMARY KEY,
  first_name VARCHAR(25),
  age	 NUMERIC,
  gender VARCHAR(7),
  experience  TEXT, 
  date	 DATE,
  title  VARCHAR(50),
  body  TEXT

);

INSERT INTO fits (first_name, age, gender, experience, date, title, body) VALUES ('Ricky' , '27' , 'male' , '1 year','09/05/2017', 'diet' , 'how to eat healthy');
INSERT INTO fits (first_name, age, gender, experience, date,  title , body) VALUES ('first name', 'age' , 'gender' , 'experience', 'date' , 'title' , 'Body text 2');

