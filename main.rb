#main.rb

# require_relative 'contact'
require_relative 'table_manager'
# require 'pry'


TableManager.open_table



john_attributes = {firstname: 'John', lastname: 'Smith', email: 'johnsmith@gmail.com'}
john = Contact.new(john_attributes)
#puts john.inspect
john.save



tyler_attributes = {firstname: 'Tyler', lastname: 'Smith', email: 'tylersmith@gmail.com'}
tyler = Contact.new(tyler_attributes)
#puts tyler.inspect
tyler.save


john_attributes = {firstname: 'John', lastname: 'Smith', email: 'johnsmith@gmail.com'}
john = Contact.new(john_attributes)
#puts john.inspect
john.save



tyler_attributes = {firstname: 'Tyler', lastname: 'Smith', email: 'tylersmith@gmail.com'}
tyler = Contact.new(tyler_attributes)
#puts tyler.inspect
tyler.save




john_attributes = {firstname: 'John', lastname: 'Smith', email: 'johnsmith@gmail.com'}
john = Contact.new(john_attributes)
#puts john.inspect
john.save



tyler_attributes = {firstname: 'Tyler', lastname: 'Smith', email: 'tylersmith@gmail.com'}
tyler = Contact.new(tyler_attributes)
#puts tyler.inspect
tyler.save



tyler_attributes = {firstname: 'Tyler', lastname: 'Rex', email: 'tylersmith@gmail.com'}
tyler = Contact.new(tyler_attributes)
puts tyler.inspect
tyler.save



puts "meta test"
# puts Contact.metaprogram



# puts "find test"
# tyler_found = Contact.find(2)

# puts tyler_found.inspect
# Contact.metaprogram
puts "find by last name"
puts Contact.find_all_by_lastname('Smith').class
# puts "find by first name"
# puts Contact.find_all_by_firstname('Tyler').class


# # puts "find by first name"
# # puts Contact.find_all_by_firstname('John').inspect


# # puts "find by email"
# # puts Contact.find_all_by_email('tylersmith@gmail.com').inspect

# puts "find by first name"
# puts Contact.find_all_universal(:firstname, 'Tyler').inspect



# ash = Contact.find(1)
# t = PhoneNumber.create(phonenumber: '13432432432',  owner: ash)

phone_attributes = {number_of_phone: '4324324324', contact_id: '1'}
someone_number = Phone.new(phone_attributes)
someone_number.save


def generate_phone_number
  rand.to_s[2..11] 

end

for i in 0..Contact.count-1

phone_attributes = {number_of_phone: generate_phone_number , contact_id: rand(Contact.count)}
someone_number = Phone.new(phone_attributes)
someone_number.save


end







puts Contact.search_all('Smith').inspect



