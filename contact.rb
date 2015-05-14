require_relative 'table_manager'

class Contact < ActiveRecord::Base


  attr_accessor :firstname, :lastname, :email 
  attr_reader :id




  def initialize(firstname,lastname,email)

    @firstname = firstname
    @lastname = lastname
    @email = email

  end



  


end
