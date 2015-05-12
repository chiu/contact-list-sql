#main.rb
require_relative 'contact'
require_relative 'database'
require 'pry'


# arvinder = Instructor.new('Arvinder', 1000)
# arvinder.save

#  charlie = Database.new('Charlie', 'Bennett', 'charlie@gmail.com')
#  charlie.save


# drake = Database.new('Drake', 'Darrington', 'drakeydrake@gmail.com')
# drake.save

# drake.destroy


coolguy = Database.find(2)

#puts coolguy.inspect  


all_people = Database.all
#puts all_people.inspect


anders = Database.find_all_by_lastname('Anders')
#puts anders.inspect


puts "start test"
charlie_clones = Database.find_all_by_lastname('Bennett')
puts charlie_clones.inspect

puts "start test"
charlie_clones2 = Database.find_all_by_firstname('Charlie')
puts charlie_clones2.inspect

puts "start test"
charlie_clones2 = Database.find_all_by_firstname('Drake')
puts charlie_clones2.inspect

puts "email start test"
email_clones2 = Database.find_all_by_email('drakeydrake@gmail.com')
puts email_clones2.inspect


 puts "universal test"

anders = Database.find_all_by_lastname('Anders')
 puts anders.inspect
