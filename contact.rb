# require_relative 'table_manager'

class Contact < ActiveRecord::Base


     has_many :phonenumbers

 def self.find_all_by_lastname(name_argument)
    where(lastname:  name_argument)
 end

 def self.find_all_by_firstname(name_argument)
   where(firstname:  name_argument)
 end

 def self.find_all_by_email(name_argument)
    where(email:  name_argument)
 end


def self.search_all(search)

where("firstname LIKE ? OR lastname LIKE ? OR email LIKE ?", "%#{search}%","%#{search}%","%#{search}%")
end


# #metaprogramming: ruby monk
# # define_method("test_find_all_by_lastname") do |lastname_argument|
# #          find_all_universal(lastname_key, lastname_value)
# #        end


# def self.find_all_universal(column_name, name_argument)
#   where(column_name => name_argument)
# end



# class << self
# def metaprogram
#  ["firstname", "lastname", "email"].each do |action|
#     define_method("find_all_by_#{action}") do |argument|
#       "performing #{action.gsub('_', ' ')} on #{argument}"
#       find_all_universal(action.to_sym, argument)
#     end
#   end
# end


# end










end
