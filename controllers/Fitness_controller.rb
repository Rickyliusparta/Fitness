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

  get '/:id' do
    
    id = params[:id].to_i

    @fitness = Fit.find id 

    
    erb :'fitnesses/show'

  end
  
  
  post '/' do

    fitness = Fit.new
    fitness.first_name = params[:first_name]
    fitness.age = params[:age].length != 0 ? params[:age] : 0
    fitness.gender = params[:gender]
    fitness.experience = params[:experience]
    fitness.date = Date.parse(params[:date]) rescue nil ? params[:date] : Date.new
    fitness.title = params[:title]
    fitness.body = params[:body]  
    fitness.file = params[:tfile][:filename]
    fitness.save

     File.open('public/' + params[:tfile][:filename], "w") do |f|
        f.write(params[:tfile][:tempfile].read)
     redirect '/' 

     end      

    # CREATE
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