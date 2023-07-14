# Create some users
users = User.create!([
                       { name: 'John Doe', email: 'john@example.com', password: 'password' },
                       { name: 'Jane Smith', email: 'jane@example.com', password: 'password' },
                       { name: 'Mike Johnson', email: 'mike@example.com', password: 'password' }
                     ])

# Create some groups
groups = Group.create!([
                         { name: 'Meal', icon: 'https://cdn-icons-png.flaticon.com/512/4080/4080032.png',
                           user_id: users[0].id },
                         { name: 'Traveling', icon: 'https://cdn-icons-png.flaticon.com/512/6213/6213814.png',
                           user_id: users[1].id },
                         { name: 'Gaming', icon: 'https://pics.freeicons.io/uploads/icons/png/41018396316342845934476-512.png', user_id: users[2].id }
                       ])

# Create some deals
deals = Deal.create!([
                       { name: 'Macdonald', amount: 100.0, user_id: users[0].id },
                       { name: 'USA tour', amount: 200.0, user_id: users[1].id },
                       { name: 'Chess match', amount: 300.0, user_id: users[2].id }
                     ])

# Associate deals with groups
groups[0].deals << deals[0]  # Deal 1 is associated with Group 1
groups[1].deals << deals[1]  # Deal 2 is associated with Group 2
groups[2].deals << deals[2]  # Deal 3 is associated with Group 3

puts 'Data seeded successfully!'
