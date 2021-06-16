     
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
require 'pg'

require_relative 'db/db'

require_relative 'models/record'

require_relative 'controllers/records_controller'

get '/' do
  erb :'info/index'
end