require 'sinatra/base'

class MessageBoard < Sinatra::Base
  get '/' do 
    erb(:index)
  end

  post '/view' do 
    'Hello'
    @name = params[:name]
    @message = params[:message]
    erb(:display)
  end 

  run! if app_file == $0
end 