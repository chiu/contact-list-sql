require_relative 'table_manager'

class Contact < ActiveRecord::Base


  attr_accessor :firstname, :lastname, :email 
  attr_reader :id

  @@postgres = TableManager.open_table



  def postgres
    @@postgres = TableManager.open_table
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

# def save
#   if is_new?
#     result = postgres.exec_params('INSERT INTO contacts (firstname, lastname, email) VALUES ($1, $2, $3) returning id', [@firstname, @lastname, @email])
#     @id = result[0]['id']
#   else
#     postgres.exec_params('UPDATE contacts SET firstname = $1, lastname = $2, email = $3 WHERE id = $4', [@firstname, @lastname, @email, @id])
#   end
# end

# def destroy
#   postgres.exec_params('DELETE FROM contacts WHERE id = $1', [@id])
# end



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

