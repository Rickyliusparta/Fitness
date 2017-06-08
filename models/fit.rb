class Fit

  def self.open_connection
   PG.connect(dname: "forum")
  end

 
end