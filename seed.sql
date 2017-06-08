DROP TABLE IF EXISTS fitness;

CREATE TABLE fitness (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  body TEXT

);

INSERT INTO fitness (title , body) VALUES ('fitness 1' , 'Body text 1');
INSERT INTO fitness (title , body) VALUES ('fitness 2' , 'Body text 2');
INSERT INTO fitness (title , body) VALUES ('fitness 3' , 'Body text 3');
INSERT INTO fitness (title , body) VALUES ('fitness 4' , 'Body text 4');