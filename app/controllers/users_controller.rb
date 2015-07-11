get '/users' do
  redirect "/users/#{current_user.id}"
end

post '/users' do
  user = User.new(params)
  user.save!
  if user
    session[:user_id] = user.id
    redirect "/users/#{current_user.id}"
  else
    redirect '/signup'
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  @rounds = @user.rounds
  if @user == nil
    @user = current_user
  end
  erb :'/users/show'
end

get '/users/:id/edit' do
  erb :'/users/edit'
end

put '/users/:id' do
  current_user.update_attributes(params[:user])
  redirect "/users/#{current_user.id}/edit"
end