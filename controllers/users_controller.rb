get '/signup' do
  erb :'users/new'
end

post '/users/new' do
  first_name = params[:first_name]
  last_name = params[:last_name]
  email = params[:email]
  password = params[:password]

  create_user(first_name, last_name, email, password)

  redirect '/'
end