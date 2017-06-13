class FitnessesController < Sinatra::Base
  

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  
  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") } 
  set :public_folder, Proc.new { File.join(root, "public") } 

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
  
      # "NEW" 

  end

  get '/training' do
    erb :"training/show" 

  end

  get '/:id' do
    
    id = params[:id].to_i

    @fitness = Fit.find id 

    fitness = Fit.new
    fitness.body = params[:body]

    
    erb :'fitnesses/show'

  end
  
  
  post '/' do

    fitness = Fit.new
    fitness.first_name = params[:first_name]
    fitness.age = params[:age].length != 0 ? params[:age] : 0
    fitness.gender = params[:gender]
    fitness.experience = params[:experience].length != 0 ? params[:experience] : 0
    fitness.date = params[:date].length != 0 ? params[:date] : '01-01-1970'
    fitness.title = params[:title]
    fitness.body = params[:body]  
    file = params[:tfile][:filename] if params[:tfile]
    fitness.file = file
    fitness.save

    if params[:tfile]
      File.open('public/' + file, "w") do |f|
        f.write(params[:tfile][:tempfile].read) 
      end
    end      
    redirect '/' 

    # CREATE
  end

  put '/:id'  do
    id = params[:id].to_i
    fitness = Fit.find id
    fitness.first_name = params[:first_name]
    fitness.age = params[:age].length != 0 ? params[:age] : 0
    fitness.gender = params[:gender]
    fitness.experience = params[:experience].length != 0 ? params[:experience] : 0
    fitness.date = params[:date].length != 0 ? params[:date] : '01-01-1970'
    fitness.title = params[:title][:filename] if params[:tfile]
    fitness.body = params[:body]
    fitness.file = file
    fitness.update 
    redirect "/"

    if params[:tfile]
      File.open('public/' + file, "w") do |f|
        f.write(params[:tfile][:tempfile].read) 
    
      end

    end
    # update

  end

  delete '/:id' do

    id = params[:id].to_i

    Fit.destroy id

    redirect '/'

  end

  get '/:id/edit' do

    id = params[:id].to_i

     @fitness = Fit.find id

    erb :'fitnesses/edit'

  end




end