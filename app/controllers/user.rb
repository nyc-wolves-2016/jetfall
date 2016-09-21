get '/register' do
  if logged_in?
    redirect '/'
  else
    erb :'users/new'
  end
end

post '/register' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

get '/login' do
  if logged_in?
    redirect '/'
  else
    erb :'users/login'
  end
end

post '/login' do
  user = User.find_by(email: params[:user][:email])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = ["Invalid email or password"]
    erb :'users/login'
  end
end

get '/logout' do
  if logged_in?
    session.clear
  end
    redirect '/'
end
