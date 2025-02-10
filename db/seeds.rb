# Create users and profiles
users_data = [
  "Bongiwe", "Genius", "Siza", "Sifiso", "Micaela",
  "Rayshaan", "Ashley", "Roberto", "Jan-Phillip", "Binta",
  "Janet", "Katherine", "Prince", "Kiki", "Tennessee", "Gabz"
]

users = users_data.map do |name|
  user = User.create!(
    email: "#{name.downcase}@example.com",
    password: 'password',
    password_confirmation: 'password'
  )

  Profile.create!(
    user_id: user.id,
    name: name
  )

  user
end

# Assign matches using rotation to avoid self-matching
givers = users.shuffle
receivers = givers.rotate(1) # Ensures each user gives and receives from different users

givers.zip(receivers).each do |giver, receiver|
  Match.create!(
    giver_id: giver.id,
    receiver_id: receiver.id,
    status: 'pending'
  )
end

puts "Seed data created successfully! 🎁"
