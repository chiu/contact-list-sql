#database.rb
require 'pg'
require 'dotenv'
require 'uri'
require 'active_record'
Dotenv.load




class TableManager


  # def self.open_table
  #   uri = URI.parse(ENV['DATABASE_URL'])
  #   @@postgres = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
  #   puts "getting contacts..."
  #   @@postgres.exec( "SELECT * FROM contacts" ) do |results|
  #     results.each do |contact_element|
  #     end
  #   end
  #   return @@postgres
  # end

  # def self.open_table
  #   uri = URI.parse(ENV['DATABASE_URL'])
  #   @@postgres = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
  #   puts "getting contacts..."
  #   @@postgres.exec( "SELECT * FROM contacts" ) do |results|
  #     results.each do |contact_element|
  #     end
  #   end
  #   return @@postgres
  # end




end