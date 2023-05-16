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

schedule_1 = Biz::Schedule.new do |config|
  config.hours = {
    mon: {'09:00' => '17:00'},
    tue: {'10:00' => '16:00'},
    wed: {'09:00' => '17:00'},
    thu: {'10:00' => '16:00'},
    fri: {'09:00' => '17:00'},
    sat: {'10:00' => '14:00'},
    sun: {'09:00' => '15:00'}
  }
end

schedule_2 = Biz::Schedule.new do |config|
  config.hours = {
    mon: {'09:00' => '17:00'},
    tue: {'10:00' => '16:00'},
    wed: {'09:00' => '17:00'},
    thu: {'18:00' => '23:00'},
    fri: {'12:00' => '20:00'},
    sat: {'11:00' => '18:00'},
    sun: {'09:00' => '15:00'}
  }
end

schedule_3 = Biz::Schedule.new do |config|
  config.hours = {
    mon: {'01:00' => '07:00'},
    tue: {'10:00' => '19:00'},
    wed: {'09:00' => '15:00'},
    thu: {'15:00' => '22:00'},
    fri: {'09:00' => '17:00'},
    sat: {'08:00' => '14:00'},
    sun: {'09:00' => '15:00'}
  }
end

Gym.create!([
             {
               title: 'Йога',
               address: 'Петровская 51 корп 1',
               schedule: schedule_1,
               capacity: 25
             },
             {
               title: 'Бодибилдинг',
               address: 'Петровская 51 корп 2',
               schedule: schedule_2,
               capacity: 20
             },
             {
               title: 'Фитнес',
               address: 'Петровская 51 корп 3',
               schedule: schedule_3,
               capacity: 15
             },
           ])

User.create!(email: 'trofimovmaxdev@gmail.com',
             password: 'qwerty1234',
             password_confirmation: 'qwerty1234',
             first_name: 'Grob',
             nickname: 'grob',
             role: User.roles[:admin])