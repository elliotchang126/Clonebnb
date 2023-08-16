# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

ApplicationRecord.transaction do
    puts 'Destroying tables...'

    User.destroy_all

    puts 'Resetting primary keys'
    ApplicationRecord.connection.reset_pk_sequence!('users')

    puts "Creating users..."

    #demo user
    User.create!(
        email: 'demo@demo.io', 
        password: 'password',
        first_name: 'Demo',
        last_name: 'User'
    )

    20.times do
        User.create!(
            email: Faker::Internet.unique.email,
            password: Faker::Internet.password(min_length: 6, max_length: 20),
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name
        )
    end

    puts "Done!"
end