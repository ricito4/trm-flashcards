
get '/user/new' do
  erb :'users/new'
end

post '/user' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id]= @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/user/:id' do
  @user=User.find(params[:id])
  @rounds= @user.rounds
  erb :'/users/show'
end
