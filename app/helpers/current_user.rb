helpers do
  def current_user
    @user = User.find_by_remember_token(session[:remember_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def secret_page
    if session[:remember_token]
      redirect "/secret/#{@user.id}"
    else
      erb :missing_page
    end
  end
end

