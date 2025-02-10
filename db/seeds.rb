Match.destroy_all
Profile.destroy_all
User.destroy_all

# Create users and profiles
users_data = [
  "Bongiwe", "Genius", "Siza", "Sifiso", "Micaela",
  "Rayshaan", "Ashley", "Roberto", "JP", "Binta",
  "Janet", "Katherine", "Prince", "Kiki", "Tennessee", "Gabz", "Ajmal"
]

counter = 1
users = users_data.map do |name|
  user = User.create!(
    email: "#{name.downcase}#{counter}@example.com",
    password: 'password',
    password_confirmation: 'password'
  )

  counter += 1

  Profile.create!(
    user_id: user.id,
    name: name
  )
  user
end

givers = users.shuffle
receivers = givers.rotate(1)

givers.zip(receivers).each do |giver, receiver|
  Match.create!(
    giver_id: giver.id,
    receiver_id: receiver.id,
    status: 'pending'
  )
end

puts "Seed data created successfully! 🎁"
