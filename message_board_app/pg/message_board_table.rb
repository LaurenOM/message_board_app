require 'pg'

begin

    con = PG.connect :dbname => 'message_board'
    
    rs = con.exec "SELECT * FROM messages LIMIT 5"

    rs.each do |row|
      puts "%s %s %s" % [ row['name'], row['message'] ]
    end
    
rescue PG::Error => e

    puts e.message 
    
ensure

    rs.clear if rs
    con.close if con
    
end