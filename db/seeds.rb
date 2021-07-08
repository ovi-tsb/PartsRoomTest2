# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@plant = Plant.create(name: "London")
puts "London plant created."

@plant1 = Plant.create(name: "Mississauga")
puts "Mississauga plant created."



@user = SuperUser.create!(email: "super@yahoo.com", 
                    password: "123456", 
                    password_confirmation: "123456", 
                    first_name: "Tom", 
                    last_name: "Hood",
                    plant_id: "1"
                  )
puts "Super user created."







#####  CSV London


require 'csv'

CSV.foreach("lib/seeds/CSVLondonParts.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
  Product.create(row.to_hash)
end



puts "There are now #{Product.count} rows in the product table"






