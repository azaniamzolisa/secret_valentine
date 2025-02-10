# db/seeds.rb

# Create users and profiles
users_data = [
  "Bongiwe", "Genius", "Siza", "Sifiso", "Micaela",
  "Rayshaan", "Ashley", "Roberto", "Jan-Phillip", "Binta",
  "Janet", "Katherine", "Prince", "Kiki", "Tennessee", "Gabz"
]

users = users_data.map do |name|
  user = User.create!(
    email: "#{name.downcase}@example.com", # You can adjust the email format as needed
    password: 'password',
    password_confirmation: 'password'
  )

  Profile.create!(
    user_id: user.id,
    name: name
  )
  user
end

# Create random matches
users.shuffle.each_slice(2) do |giver, receiver|
  # Ensure no user is paired with themselves
  next if giver == receiver

  # Create a match record for the giver and receiver
  Match.create!(
    giver_id: giver.id,
    receiver_id: receiver.id,
    status: 'pending'
  )
end
