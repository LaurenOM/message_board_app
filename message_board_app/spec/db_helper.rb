def prep_test_db
  connection = PG.connect(dbname: 'message_board_test')
  connection.exec "TRUNCATE messages, comments, users RESTART IDENTITY CASCADE;"
  connection.exec "INSERT INTO messages (name,message)
  VALUES ('Lauren','Today is a good day!') , ('Lauren', 'Tonight I am going out out!');"
  connection.exec "INSERT INTO comments (message_id, comment) VALUES (1, 'What a great post'), (2, 'That is so cool');"
end