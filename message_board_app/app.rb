require 'sinatra/base'
require './lib/board'
require './lib/comment'

class MessageBoard < Sinatra::Base
  get '/' do 
    erb(:index)
  end

  post '/store_message' do
    Board.add_message(params[:message],params[:name])
    redirect '/view'
  end 

  get '/view' do 
    @message = Board.all
    erb(:display)
  end 

  post '/add-comment' do 
    Comment.add_comment(params[:id], params[:comment])
    redirect('/view')
  end 

  get '/users/new' do 
    erb(:new_user)
  end 

  post '/users/new' do
    @name = params[:name] 
    User.add(params[:name], params[:email], params[:password])
    redirect '/view'
  end 
  
  run! if app_file == $0
end 