get '/login' do
 #make sure to use user.authenticate
end

get '/signup' do

end

get '/logout' do #done
  session[:user_id] = nil
  redirect '/'
end