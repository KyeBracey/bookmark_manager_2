
ENV['RACK_ENV'] ||= "development"

require_relative './models/tag'
require_relative './models/link'
require_relative 'datamapper_setup'
require 'sinatra/base'


class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/add_links'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.create(name: params[:tag])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/tags/bubbles' do
    @links = Link.all
    erb :'links/bubbles'
  end

end
