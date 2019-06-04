require 'pg'

class Board
  def self.all
    connection = PG.connect(dbname: 'message_board') 
    result = connection.exec('SELECT * FROM messages')
    result.map { |message| message['message']}
  end

  def add_message(message)
    connection = PG.connect(dbname: 'message_board')
    connection.exec("INSERT INTO messages (message) VALUES ('#{message}') " )
  end
end 