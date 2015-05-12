require 'pg'
require 'dotenv'
require 'uri'
Dotenv.load


 
# Establish a connection to the database (requires internet since it's on heroku!)
# Note: You'll want to put in your own heroku creds

# Connect to database.
uri = URI.parse(ENV['DATABASE_URL'])
postgres = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)


 
# Output all author records from the authors table
puts "getting authors ..."
postgres.exec( "SELECT * FROM contacts" ) do |results|
  # results is a collection (array) of records (hashes)... Nice!
  results.each do |author|
    puts author.inspect
  end
end
 
puts "Closing the db connection..."
conn.close
 
puts "DONE"