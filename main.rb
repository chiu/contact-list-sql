#main.rb
require_relative 'contact'
require_relative 'table_manager'
require 'pry'


# arvinder = Instructor.new('Arvinder', 1000)
# arvinder.save

#  charlie = TableManager.new('Charlie', 'Bennett', 'charlie@gmail.com')
#  charlie.save


# drake = TableManager.new('Drake', 'Darrington', 'drakeydrake@gmail.com')
# drake.save

# drake.destroy

TableManager.open_table

coolguy = Contact.find(2)

puts coolguy.inspect  


all_people = Contact.all
puts all_people.inspect


anders = Contact.find_all_by_lastname('Anders')
puts anders.inspect


puts "start test"
charlie_clones = Contact.find_all_by_lastname('Bennett')
puts charlie_clones.inspect

puts "start test"
charlie_clones2 = Contact.find_all_by_firstname('Charlie')
puts charlie_clones2.inspect

puts "start test"
charlie_clones2 = Contact.find_all_by_firstname('Drake')
puts charlie_clones2.inspect

puts "email start test"
email_clones2 = Contact.find_all_by_email('drakeydrake@gmail.com')
puts email_clones2.inspect


 puts "universal test"

anders = Contact.find_all_by_lastname('Anders')
 puts anders.inspect
