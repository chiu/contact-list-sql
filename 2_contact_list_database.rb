require 'pg'
require 'dotenv'
require 'uri'
Dotenv.load

class Contact
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

attr_accessor :firstname, :lastname, :email 
attr_reader :id

def postgres
  @@postgres
end

def initialize(firstname, lastname, email, id=nil)
  @firstname = firstname
  @lastname = lastname
  @email = email
  @id = id
end

def is_new?
  #puts @id
  @id.nil?
end

def save
  if is_new?
    result = postgres.exec_params('INSERT INTO contacts (firstname, lastname, email) VALUES ($1, $2, $3) returning id', [@firstname, @lastname, @email])
    @id = result[0]['id']
  else
    postgres.exec_params('UPDATE contacts SET firstname = $1, lastname = $2, email = $3 WHERE id = $4', [@firstname, @lastname, @email, @id])
  end
end

def destroy
  postgres.exec_params('DELETE FROM contacts WHERE id = $1', [@id])
end

  ## DANGER Below is wet wet code. It's up to you to DRY it out and make it more succinct.
  
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

  def self.find_all_by_lastname(lastname)
    results = []
    @@postgres.exec_params('SELECT id, firstname, lastname, email FROM contacts WHERE lastname = $1', [lastname]) do |rows|
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


  def self.find_all_by_firstname(firstname)
    results = []
    @@postgres.exec_params('SELECT id, firstname, lastname, email FROM contacts WHERE firstname = $1', [firstname]) do |rows|
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


  def self.find_all_by_email(email)
    results = []
    @@postgres.exec_params('SELECT id, firstname, lastname, email FROM contacts WHERE email = $1', [email]) do |rows|
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




  # def self.where_coolness_above(coolness)
  #   results = []
  #   postgres.exec_params('SELECT id, name, coolness FROM contacts WHERE coolness > $1', [coolness]) do |rows|
  #     rows.each do |row|
  #       results << Instructor.new(
  #         row['name'],
  #         row['coolness'],
  #         row['id']
  #         )
  #     end
  #   end
  #   results
  # end

end