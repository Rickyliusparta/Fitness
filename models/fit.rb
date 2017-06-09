class Fit

  def self.open_connection
   PG.connect(dname: "forum")
  end

  def self.hydrate fit_data

    fit = Fit.new
    fit.id = fit_data['id']
    fit.first_name = fit_data['first_name']
    fit.age = fit_data['age']
    fit.gender = fit_data['gender']
    fit.experience = fit_data['experience']
    fit.title = fit_data['title']
    fit.body = fit_data['body']

  end

  # INDEX
  def self.all
    conn = self.open_connection
    sql = "SELECT id,first_name,age,gender,experience,date,title,body FROM post ORDER BY id"
    results = conn.exec(sql)

        # create an array of post objects
    fits = results.map do |tuple| 
      self.hydrate tuple
    end
  end

  
 
end