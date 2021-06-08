# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = SuperUser.create!(email: "super@yahoo.com", 
                    password: "123456", 
                    password_confirmation: "123456", 
                    first_name: "Tom", 
                    last_name: "Hood"
                  )
puts "Super user created."


@plant = Plant.create(name: "London")
puts "London plant created."

@plant1 = Plant.create(name: "Mississauga")
puts "Mississauga plant created."