#main.rb
require_relative 'setup'
require_relative 'contact'
require_relative 'table_manager'
require 'pry'



john = Contact.new('John', 'Smith', 'johnsmith@gmail.com')
john.save
