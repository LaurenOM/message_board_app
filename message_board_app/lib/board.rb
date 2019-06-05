require 'pg'

class Board

  def self.instance
    @board ||= Board.new
  end

  def self.create_connection
    if ENV['ENVIRONMENT']== 'test'
      @connection = PG.connect(dbname: 'message_board_test')
    else
      @connection = PG.connect(dbname: 'message_board')
    end
  end 

  def self.all
    Board.create_connection
    result = @connection.exec('SELECT * FROM messages ORDER BY date_time DESC')
    # result.map { |message| { message['message'] }
  end

  def self.add_message(message,name)
    Board.create_connection
    datetime = DateTime.now 
    @connection.exec("INSERT INTO messages (message, name, date_time) VALUES ('#{message}','#{name}','#{datetime}')" )
  end
end 