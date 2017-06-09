class FitnessesController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  
  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") } 

  configure :development do
      register Sinatra::Reloader
  end


  $fitnesses = [{
    id: 0,
    title: "Easy Cardio",
    body: "ways to do cardio"
 },
 {
    id: 1,
    title:"Body Mass",
    body: "increase mass in weeks"
 },
 {
    id: 2,
    title: "diet",
    body: "ways to eat healthy without gaining fat"
  
  }];

  get '/' do
    
    @title = "forum"

    @fitnesses = Fit.all

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
  
  
  # post '/' do

  #   fitness = {
  #     id: $fitnesses.length,
  #     title: params[:title],
  #     body: params[:body]
  #   }
  #   $fitnesses.push fitness
  #   redirect '/'

  # end

  # put '/:id' do

  #  id = params[:id].to_i

  #   [id][:title] = params[:title]
  #   [id][:body] = params[:body]

  #   redirect '/'

  # end

  # delete '/:id' do

  #   id = params[:id].to_i

  #   $fitnesses.delete_at(id)

  #   redirect '/'

  # end

  get '/:id/edit' do

    id = params[:id].to_i

     @fitnesses = Fit.find id

    erb :'fitnesses/edit'

  end




end