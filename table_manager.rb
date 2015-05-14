require 'pry' # incase you want to use binding.pry
require 'active_record'
require_relative 'contact'
# require_relative 'store'
# require_relative 'employee'


class TableManager


  def self.open_table

# Output messages from AR to STDOUT
ActiveRecord::Base.logger = Logger.new(STDOUT)

puts "Establishing connection to database ..."


# heroku-postgres-3780b633 :: amber
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  encoding: 'unicode',
  pool: 5,
  database: 'demv8hbqtccc8t',
  username: 'rjyqxzxnjhxfgn',
  password: 'Lx6LUJpdJriPW_Pi0JIWqlp4FA',
  host: 'ec2-54-243-187-196.compute-1.amazonaws.com',
  port: 5432,
  min_messages: 'error'
  )

puts "CONNECTED"

puts "Setting up Database (recreating tables) ..."

ActiveRecord::Schema.define do

  drop_table :contacts if ActiveRecord::Base.connection.table_exists?(:contacts)

  create_table :contacts do |t|
    t.column :firstname, :string
    t.column :lastname, :string
    t.column :email, :string
    t.timestamps
  end
end

puts "Setup DONE"

end


end
