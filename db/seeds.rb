100.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  profile = Faker::Address.city
  User.create!(name: name,
               email: email,
               profile: profile,
               password: password,
               password_confirmation: password,
               )
end