require 'pg'

class Comment 

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

  def self.all(message_id)
    Comment.create_connection
    result = @connection.exec("SELECT * FROM comments WHERE message_id=#{message_id}")
    result.map { |row| row }
  end 

  def self.add_comment(message_id, comment)
    Comment.create_connection
    @connection.exec("INSERT INTO comments (message_id, comment) VALUES (#{message_id},'#{comment}')")
  end
end 