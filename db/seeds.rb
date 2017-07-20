require 'random_data'

# Create Users
5.times do
  User.create!(
  email: RandomData.random_email,
  password: RandomData.random_sentence
  )
end
users = User.all


# Create Public Wikis
15.times do
  Wiki.create!(
  user: users.sample,
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph
  )
end
wikis = Wiki.all

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
