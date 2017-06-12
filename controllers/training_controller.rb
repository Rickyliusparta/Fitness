class TrainingsController < Sinatra::Base
  

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  
  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views/training") } 

  configure :development do
      register Sinatra::Reloader
  end

  get '/training' do

     @title = "forum"

    @trainings = Fit.all

    erb :'trainings/index'
  end

  get "/:id" do

    id - params[:id].to_i

    @fitness = Fit.find id

    erb :'trainings/show'
  end
end

