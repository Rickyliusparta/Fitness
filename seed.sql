DROP TABLE IF EXISTS fitness;

CREATE TABLE fits (

  id SERIAL PRIMARY KEY,
  first_name VARCHAR(25) NOT NULL,
  age	 NUMERIC NOT NULL,
  gender VARCHAR(7) NOT NULL,
  experience  TEXT NOT NULL, 
  date	 DATE NOT NULL,
  title  VARCHAR(50) NOT NULL,
  body  TEXT NOT NULL

);

INSERT INTO fits (first_name, age, gender, experience, date, title, body) VALUES ('Ricky' , '27' , 'male' , '1 year','09/05/2017', 'diet' , 'how to eat healthy');
INSERT INTO fits (first_name, age, gender, experience, date,  title , body) VALUES ('first name', 'age' , 'gender' , 'experience', 'date' , 'title' , 'Body text 2');

