class Fit
  attr_accessor :id, :first_name, :age, :gender, :experience, :title, :date, :body, :file

  def self.open_connection
    PG.connect(dbname:"forum")
  end

  def self.hydrate fit_data

    fit = Fit.new 
    fit.id = fit_data['id']
    fit.first_name = fit_data['first_name']
    fit.age = fit_data['age']
    fit.gender = fit_data['gender']
    fit.experience = fit_data['experience']
    fit.date = fit_data['date']
    fit.title = fit_data['title']
    fit.body = fit_data['body']
    fit.file = fit_data['file']

    fit

  end

  def self.all
    conn = self.open_connection
    sql = "SELECT id,first_name,age,gender,experience,date,title,body,file FROM fits ORDER BY id"
    results = conn.exec(sql)

    fit = results.map do |tuple| 
      self.hydrate tuple
    end
  end


  def self.find id
    conn = self.open_connection
    sql = "SELECT id,first_name,age,gender,experience,date,title,body,file FROM fits WHERE id = #{id}"
    results = conn.exec(sql) 
    self.hydrate results.first  
  end

  def save 
    conn = Fit.open_connection
    sql = "INSERT INTO fits (first_name,age,gender,experience,date,title,body,file) VALUES ( '#{self.first_name}', '#{self.age}', '#{self.gender}', '#{self.experience}', '#{self.date}', '#{self.title}', '#{self.body}', '#{self.file}')"
    conn.exec(sql)
  end

  def update
    conn = Fit.open_connection
    sql = "UPDATE fits SET first_name='#{self.first_name}', age='#{self.age}' , gender='#{self.gender}', experience='#{self.experience}', date='#{self.date}', title='#{self.title}', body='#{self.body}', file='#{self.file}' WHERE id = '#{self.id}'"
    conn.exec(sql)
  end


  def self.destroy id
    conn = self.open_connection
    sql = "DELETE FROM fits WHERE id = #{id}"
    conn.exec(sql)
  end
 
end