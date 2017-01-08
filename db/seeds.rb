User.create!(name:  "Massilia Ait Gherbi",
             email: "aitgherbim@eisti.eu",
             password:              "motdepasse",
             password_confirmation: "motdepasse",
             admin: true)

5.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@eisti.edu"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
1.times do
  name = "ubuntu"
  users.each { |user| user.vms.create!(name: name) }
end
