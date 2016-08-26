get '/login' do
  erb :'users/login'
end

post '/login' do
  @username = params[:user][:username]
  @user  = User.find_by(username: @username)
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ['Invalid username/password']
    erb :'/users/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
