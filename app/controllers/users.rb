enable :sessions

before ('/') do
  current_user
  secret_page
end

get '/' do
  @urls = Url.order("created_at DESC")
  erb :index
end

post '/login' do
  @user = User.find_by_email(params[:email])
  # @urls = Url.find_by_user_id(params[:user_id]).first
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
    redirect "/secret/#{@user.id}"
  else
    erb :missing_page
  end
end

get '/secret/:id' do
  if current_user
    @urls = Url.where('user_id = ?', params[:id]).order("created_at DESC")
    erb :secretpage
  else
  redirect '/'
  end
end

post '/logout' do
  session.clear
  redirect '/'
end

not_found do
  erb :missing_page
end
