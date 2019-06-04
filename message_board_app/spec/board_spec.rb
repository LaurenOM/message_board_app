require 'board'
describe 'Board' do 
  it 'all method shows all the bookmarks' do 
    messages = Board.all
    expect(messages).to include 'Hey there'
    expect(messages).to include "What a nice day"
  end 
end 