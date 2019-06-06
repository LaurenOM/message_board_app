require 'pg'

class User
  def self.create_connection
    if ENV['ENVIRONMENT']== 'test'
      @connection = PG.connect(dbname: 'message_board_test')
    else
      @connection = PG.connect(dbname: 'message_board')
    end
  end 


  def self.all
    Board.create_connection
    result = @connection.exec('SELECT * FROM users')
    result.map { |user| user }
  end

  def self.add(name, email, password)
    Comment.create_connection
    @connection.exec("INSERT INTO comments (name, email, password) VALUES ('#{name}','#{email}','#{password}')")
  end
end 