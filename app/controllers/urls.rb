post '/urls' do
  @urls = Url.order("created_at DESC") #TODO: make this order in a sane way
  @url = Url.new :long_url => params[:long_url]

  if @url.save
    redirect '/'
  else
    redirect '/error'
  end
end

get '/error' do
  erb :error
end

post '/secret/:user_id/urls' do
  current_user
  @url = Url.create :long_url => params[:long_url],
                    :user_id => params[:user_id]
  redirect "/secret/#{current_user.id}"
end

get '/:short_url' do
  @url = Url.find_by_short_url(params[:short_url])
  @new_count = (@url.click_count + 1)
  @url.update_attribute :click_count, @new_count
  redirect "#{@url.long_url}"
end
