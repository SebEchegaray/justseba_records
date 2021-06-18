require 'bcrypt'

get '/login' do
  erb :'sessions/login', locals: { error_msg: "" }
end

post '/sessions' do
  email = params[:email]
  password = params[:password]

  user = find_user_by_email(email)
  
  if BCrypt::Password.new(user["password"]) == password
    session[:user_id] = user["id"]
    redirect '/'
  else
    erb :'sessions/login', locals: { error_msg: "Incorrect password" }
  end
end

delete '/sessions' do
  session[:user_id] = nil

  redirect '/'
end