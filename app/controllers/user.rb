get '/register' do
  erb :'users/new'
end

post '/register' do
  user = User.new(params[:user])
  if user.save
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

get '/login' do

end

get '/logout' do

end
