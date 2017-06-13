require 'pg'
class DatabaseSetup
    def self.open_connection
        PG.connect({
            dbname: ENV['DB_NAME'], 
            host: ENV['DB_HOST'],
            port: ENV['DB_PORT'],
            user: ENV['DB_USER'],
            password: ENV['DB_PASSWORD']
        })
    end
    def self.go
        conn = self.open_connection
        sql = "CREATE TABLE fits (

            id SERIAL PRIMARY KEY,
            first_name VARCHAR(25) NULL,
            age    NUMERIC NULL,
            gender VARCHAR(7) NULL,
            experience  NUMERIC NULL, 
            date   DATE NULL,
            title  VARCHAR(50) NULL,
            body  TEXT NULL,
            file VARCHAR(100) NULL
            );"
        conn.exec(sql)
    end
end
DatabaseSetup.go