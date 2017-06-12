require 'sinatra'
require 'pg'
require 'sinatra/reloader' if development?
require 'pry'
require_relative './models/fit.rb'
require_relative './controllers/fitness_controller.rb'
require_relative './controllers/training_controller.rb'


use Rack::MethodOverride

run FitnessesController