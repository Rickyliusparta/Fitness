class Fit

  def self.ope_connection
   PG.connect(dname: "forum")
  end


end