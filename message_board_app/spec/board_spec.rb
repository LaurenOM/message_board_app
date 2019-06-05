require 'board'
describe 'Board' do 
  it 'all method shows all the messages' do 
    messages = Board.all
    expect(messages.first.message).to include 'Today is a good day!'
  end 

  it 'adds a message to all and returns it' do 
    Board.add_message('new message', 'Lauren')
    expect(Board.all.last.message).to eq('new message')
  end 
end 