require 'pg'

class Board

  def self.instance
    @board ||= Board.new
  end

  def self.all
    connection = PG.connect(dbname: 'message_board') 
    result = connection.exec('SELECT * FROM messages ORDER BY date_time DESC')
    # result.map { |message| { message['message'] }
  end

  def self.add_message(message)
    connection = PG.connect(dbname: 'message_board')
    datetime = DateTime.now 
    connection.exec("INSERT INTO messages (message, date_time) VALUES ('#{message}', '#{datetime}')" )
  end
end 