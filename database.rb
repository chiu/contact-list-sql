#database.rb
require 'pg'
require 'dotenv'
require 'uri'
Dotenv.load




class Database




  #def self.connect
    uri = URI.parse(ENV['DATABASE_URL'])
@@postgres = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
# Output all author records from the authors table
puts "getting contacts..."
@@postgres.exec( "SELECT * FROM contacts" ) do |results|
  # results is a collection (array) of records (hashes)... Nice!
  results.each do |contact_element|
   # puts contact_element.inspect
 end
end




#end




def self.find_univeral(column_name, value)
  results = []
  puts column_name
  puts query_string = "SELECT id, firstname, lastname, email FROM contacts WHERE #{column_name} = $1"
  @@postgres.exec_params(query_string, [value]) do |rows|
    rows.each do |row|
      results << Contact.new(row['firstname'],row['lastname'],row['email'],row['id'])
    end
  end
  results
end


def self.find_all_by_firstname(firstname_value)
 self.find_univeral('firstname', firstname_value)
end

def self.find_all_by_email(email_value)
  self.find_univeral('email', email_value)
end


def self.find_all_by_lastname(lastname_value)
 self.find_univeral('lastname', lastname_value)
end


  
  def self.find(id)
    result = nil
    @@postgres.exec_params('SELECT id, firstname, lastname, email FROM contacts WHERE id = $1 LIMIT 1', [id]) do |rows|
      rows.each do |row|
        result = Contact.new(
          row['firstname'],
          row['lastname'],
          row['email'],
          row['id']
          )
      end
    end
    result
  end

  def self.all
    results = []
    @@postgres.exec_params('SELECT id, firstname, lastname, email FROM contacts') do |rows|
      rows.each do |row|
        results << Contact.new(
         row['firstname'],
         row['lastname'],
         row['email'],
         row['id']
         )
      end
    end
    results
  end




end