def prep_test_db
  connection = PG.connect(dbname: 'message_board_test')
  connection.exec "TRUNCATE messages RESTART IDENTITY CASCADE;"
  connection.exec "INSERT INTO messages (name,message)
  VALUES ('Lauren','Today is a good day!') , ('Lauren', 'Tonight I am going out out!');"
end