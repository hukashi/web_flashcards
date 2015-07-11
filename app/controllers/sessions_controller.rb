get '/login' do
  erb :'/sessions/login'
end

post '/login' do
  user = User.find_by_username(params[:username])
  if user.password == params[:password]
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect '/login'
  end
end

get '/signup' do
  erb :'/sessions/signup'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end