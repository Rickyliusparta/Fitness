require 'sinatra'
require 'pg'
require 'sinatra/reloader' if development?
require_relative './models/fit.rb'
require_relative './controllers/fitness_controller.rb'


use Rack::MethodOverride

run FitnessesController