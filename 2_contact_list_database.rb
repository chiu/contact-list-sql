require 'pg'
require 'dotenv'
require 'uri'
Dotenv.load

#==================below is pasted code


class Contact2
  # # These are my database credentials. You'll need to replace them with yours.
  # CONN = PG::Connection.new({
  #     host: 'localhost',
  #     user: 'classdemo',
  #     password: 'classdemo',
  #     dbname: 'ormlecture'
  # })
# Establish a connection to the database (requires internet since it's on heroku!)
# Note: You'll want to put in your own heroku creds
# Connect to database.
uri = URI.parse(ENV['DATABASE_URL'])
CONN = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
# Output all author records from the authors table
puts "getting authors ..."
CONN.exec( "SELECT * FROM contacts" ) do |results|
  # results is a collection (array) of records (hashes)... Nice!
  results.each do |author|
    puts author.inspect
  end
end

puts "Closing the db connection..."
CONN.close
puts "DONE"


attr_accessor :firstname, :lastname, :email
attr_reader :id

def initialize(firstname, lastname, email, id=nil)
  @name = firstname
  @lastname = lastname
  @email = email
  @id = id
end

def is_new?
  @id.nil?
end

def valid?
  id != nil
end

def save
  raise 'Invalid Instructor!' unless valid?
  if is_new?
    result = CONN.exec_params('INSERT INTO contacts (firstname, lastname) VALUES ($1, $2) returning id', [@firstname, @lastname])
      # binding.pry
      @id = result[0]['id']
    else
      CONN.exec_params('UPDATE contacts SET name = $1, coolness = $2 WHERE id = $3', [@name, @coolness, @id])
    end
  end

  def destroy
    CONN.exec_params('DELETE FROM contacts WHERE id = $1', [@id])
  end

  ## DANGER Below is wet wet code. It's up to you to DRY it out and make it more succinct.
  
  def self.find(id)
    result = nil
    CONN.exec_params('SELECT id, name, coolness FROM contacts WHERE id = $1 LIMIT 1', [id]) do |rows|
      rows.each do |row|
        result = Instructor.new(
          row['name'],
          row['coolness'],
          row['id']
          )
      end
    end
    result
  end

  def self.all
    results = []
    CONN.exec_params('SELECT id, name, coolness FROM contacts') do |rows|
      rows.each do |row|
        results << Instructor.new(
          row['name'],
          row['coolness'],
          row['id']
          )
      end
    end
    results
  end

  def self.where_coolness_above(coolness)
    results = []
    CONN.exec_params('SELECT id, name, coolness FROM contacts WHERE coolness > $1', [coolness]) do |rows|
      rows.each do |row|
        results << Instructor.new(
          row['name'],
          row['coolness'],
          row['id']
          )
      end
    end
    results
  end

end