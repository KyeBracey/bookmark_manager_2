
ENV['RACK_ENV'] ||= "development"


require_relative 'datamapper_setup'
require 'sinatra/base'


class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'UTNc2QO49ClxtxS9RFLkpCeUZBg='

  helpers do
    def current_user
      @current_user ||= User.first(id: session[:user_id])
    end
  end


  get '/' do
    erb :'sign_up'
  end

  post '/create_user' do
    user = User.create(email_address: params[:email_address],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect '/links'
  end

  get '/links' do
    current_user
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/add_links'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tags = params[:tag].split(',').map{|tag| Tag.first_or_create(name: tag.strip)}
    tags.each{|tag| link.tags << tag}
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

end
