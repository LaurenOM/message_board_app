require 'sinatra/base'

class MessageBoard < Sinatra::Base
  get '/' do 
    erb(:index)
  end

  post '/view' do 
    @message = params[:message]
    erb(:display)
  end 

  run! if app_file == $0
end 