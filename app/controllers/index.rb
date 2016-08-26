get '/' do
  erb :'index'
end

post '/' do
  @username = params[:user][:username]
  @user  = User.find_by(username: @username)
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    erb :index
  else
    @errors = ['Invalid username/password']
    erb :'/users/login'
  end
end
