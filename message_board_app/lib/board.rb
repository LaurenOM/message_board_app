require 'pg'

class Board
  def self.all
    connection = PG.connect(dbname: 'message_board') 
    result = connection.exec('SELECT * FROM messages')
    result.map { |message| message['message']}
  end 
end 