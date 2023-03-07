# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# if Doorkeeper::Application.count.zero?
#   Doorkeeper::Application.create!(name: 'Web Client', redirect_uri: '', scopes: '')
#   Doorkeeper::Application.create!(name: 'iOS Client', redirect_uri: '', scopes: '')
#   Doorkeeper::Application.create!(name: 'Android Client', redirect_uri: '', scopes: '')
#   Doorkeeper::Application.create!(name: 'React', redirect_uri: '', scopes: '')
# end


Gym.create([
             {
               title: 'SPORT PLUS',
               address: 'Petrovskaya 51',
             },
             {
               title: 'SPORT PLUS CLASS 2',
               address: 'Petrovskaya 51 corp 2',
             },
             {
               title: 'SPORT PLUS CLASS 3',
               address: 'Petrovskaya 51 corp 3',
             },
           ])

User.first_or_create(email: 'trofimovmaxdev@gmail.com',
                     password: 'qwerty1234',
                     password_confirmation: 'qwerty1234',
                     role: User.roles[:admin])