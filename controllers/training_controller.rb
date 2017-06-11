class TrainingsController < Sinatra::Base
  

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  
  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") } 

  configure :development do
      register Sinatra::Reloader
  end

  get '/training' do

     @title = "forum"

    @fitness = Fit.all

    erb :'fitnesses/index'
  end

end

