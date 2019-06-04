require 'sinatra/base'
require './lib/board'

class MessageBoard < Sinatra::Base
  get '/' do 
    erb(:index)
  end

  post '/store_message' do
    Board.add_message(params[:message])
    redirect '/view'
  end 

  get '/view' do 
    @message = Board.all
    erb(:display)
  end 

  run! if app_file == $0
end 