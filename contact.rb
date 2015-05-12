require_relative 'database'

class Contact


attr_accessor :firstname, :lastname, :email 
attr_reader :id

def postgres
  @@postgres = Database.connect
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