class FitnessesController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  
  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") } 

  configure :development do
      register Sinatra::Reloader
  end


  get '/' do
    
    @title = "forum"

    @fitness = Fit.all

    erb :'fitnesses/index'
 
  end

  get '/new' do
    
    erb :'fitnesses/new'
  
  end

 get '/:id' do
    
    id = params[:id].to_i

    @fitness = Fit.find id 
    
    erb :'fitnesses/show'

  end
  
  
  post '/' do

    fitness = Fit.new
      fitness.first_name = params[:first_name]
      fitness.age = params[:age]
      fitness.gender = params[:gender]
      fitness.experience = params[:experience]
      fitness.date = params[:date]
      fitness.title = params[:title]
      fitness.body = params[:body]
      fitness.save
      redirect '/'

  end

  put '/:id'  do
    id = params[:id].to_i
    fitness = Fit.find id
    fitness.first_name = params[:first_name]
    fitness.age = params[:age]
    fitness.gender = params[:gender]
    fitness.experience = params[:experience]
    fitness.date = params[:date]
    fitness.title = params[:title]
    fitness.body = params[:body]
    fitness.update 
    redirect "/"

  end

  # delete '/:id' do

  #   id = params[:id].to_i

  #   $fitnesses.delete_at(id)

  #   redirect '/'

  # end

  get '/:id/edit' do

    id = params[:id].to_i

     @fitness = Fit.find id

    erb :'fitnesses/edit'

  end




end