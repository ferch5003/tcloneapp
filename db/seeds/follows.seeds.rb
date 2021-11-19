after :users do
  puts 'Seeding Follows...'

  first_user = User.first
  second_user = User.second
  third_user = User.third

  first_user.follow(second_user)
  second_user.follow(third_user)
  third_user.follow(second_user)

  puts 'Follows already seed!'
end