require 'devise'

10.times do
  RegisteredApp.create!(
    name: Faker::Lorem.word,
    url: Faker::Internet.url,
    user: User.first
  )
end

puts "The seeding of data is complete."
puts "#{RegisteredApp.count} registered apps have been created."
