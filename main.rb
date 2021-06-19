require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
require 'pg'
require "discogs"

enable :sessions

require_relative 'db/db'

require_relative 'helpers/sessions_helper'

require_relative 'models/record'
require_relative 'models/user'
require_relative 'models/extra'

require_relative 'controllers/records_controller'
require_relative 'controllers/users_controller'
require_relative 'controllers/sessions_controller'
require_relative 'controllers/extras_controller'

get '/' do
  erb :'info/index'
end