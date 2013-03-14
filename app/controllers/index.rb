enable :sessions

before ('/') do
  current_user
  secret_page
end

get '/' do
  erb :index
end

post '/login' do
  @user = User.find_by_email(params[:email])
  if @user.authenticate(params[:password])
    session[:remember_token] = @user.remember_token
    redirect "/secret/#{@user.id}"
  else
    redirect '/'
  end
end

post '/signup' do
  @user = User.new :email => params[:email],
                   :password => params[:password]
  if @user.save
    redirect '/'
    else
    erb :missing_page
  end
end

get '/secret/:id' do
  if current_user
    erb :secretpage
  else
  redirect '/'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

not_found do
  erb :missing_page
end
