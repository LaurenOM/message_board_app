require 'pg'

class Board
  attr_reader :id, :name, :message
  def initialize(id:, name:, message:)
    @id = id
    @name = name
    @message = message
  end

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
    result.map do |message|
      Board.new(id: message['id'], name: message['name'], message: message['message'])
    end
  end

  def self.add_message(message,name)
    Board.create_connection
    datetime = DateTime.now 
    @connection.exec("INSERT INTO messages (message, name, date_time) VALUES ('#{message}','#{name}','#{datetime}')" )
  end
end 