DROP TABLE IF EXISTS fitness;

CREATE TABLE fitness (

  id SERIAL PRIMARY KEY,
  first_name VARCHAR(25),
  age	 NUMERIC,
  gender VARCHAR(7),
  experience  TEXT, 
  date	 DATE,
  title  VARCHAR(50),
  body  TEXT

);

INSERT INTO fitness (first_name, age, gender, experience, date,  title , body, ) VALUES ('first name', 'age', 'date', 'gender', 'experience','fitness 1' , 'Body text 1');
INSERT INTO fitness (first_name, age, gender, experience, date,  title , body, ) VALUES ('first name', 'age', 'date', 'gender', 'experience','fitness 2' , 'Body text 2');
INSERT INTO fitness (first_name, age, gender, experience, date,  title , body, ) VALUES ('first name', 'age', 'date', 'gender', 'experience','fitness 3' , 'Body text 3');
INSERT INTO fitness (first_name, age, gender, experience, date,  title , body, ) VALUES ('first name', 'age', 'date', 'gender', 'experience','fitness 4' , 'Body text 4');
