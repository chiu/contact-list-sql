# require_relative 'table_manager'

class Contact < ActiveRecord::Base


 def self.find_all_by_lastname(name_argument)
   result = []
   binding.pry
   result << where(lastname:  name_argument)
 end

 def self.find_all_by_firstname(name_argument)
   result = []
   result << where(firstname:  name_argument)
 end

 def self.find_all_by_email(name_argument)
   result = []
   result << where(email:  name_argument)
 end

end
