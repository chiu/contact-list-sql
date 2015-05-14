#main.rb

# require_relative 'contact'
require_relative 'table_manager'
# require 'pry'


TableManager.open_table



john_attributes = {firstname: 'John', lastname: 'Smith', email: 'johnsmith@gmail.com'}
john = Contact.new(john_attributes)
puts john.inspect
john.save



tyler_attributes = {firstname: 'Tyler', lastname: 'Smith', email: 'tylersmith@gmail.com'}
tyler = Contact.new(tyler_attributes)
puts tyler.inspect
tyler.save


john_attributes = {firstname: 'John', lastname: 'Smith', email: 'johnsmith@gmail.com'}
john = Contact.new(john_attributes)
puts john.inspect
john.save



tyler_attributes = {firstname: 'Tyler', lastname: 'Smith', email: 'tylersmith@gmail.com'}
tyler = Contact.new(tyler_attributes)
puts tyler.inspect
tyler.save




john_attributes = {firstname: 'John', lastname: 'Smith', email: 'johnsmith@gmail.com'}
john = Contact.new(john_attributes)
puts john.inspect
john.save



tyler_attributes = {firstname: 'Tyler', lastname: 'Smith', email: 'tylersmith@gmail.com'}
tyler = Contact.new(tyler_attributes)
puts tyler.inspect
tyler.save



tyler_attributes = {firstname: 'Tyler', lastname: 'Rex', email: 'tylersmith@gmail.com'}
tyler = Contact.new(tyler_attributes)
puts tyler.inspect
tyler.save




puts "find test"
tyler_found = Contact.find(2)

puts tyler_found.inspect

puts "find by last name"
puts Contact.find_all_by_lastname('Rex').inspect


puts "find by first name"
puts Contact.find_all_by_firstname('John').inspect


puts "find by email"
puts Contact.find_all_by_email('tylersmith@gmail.com').inspect

