#main.rb

# require_relative 'contact'
require_relative 'table_manager'
# require 'pry'


TableManager.open_table



john_attributes = {firstname: 'John', lastname: 'Smith', email: 'johnsmith@gmail.com'}
john = Contact.new(john_attributes)
puts john.inspect
john.save