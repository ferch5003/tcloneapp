puts 'Seeding Users...'

User.create(
  full_name: Faker::Name.name,
  username: 'test_1',
  email: 'test1@mail.com',
  password: '12345678',
)

User.create(
  full_name: Faker::Name.name,
  username: 'test_2',
  email: 'test2@mail.com',
  password: '12345678',
)

User.create(
  full_name: Faker::Name.name,
  username: 'test_3',
  email: 'test3@mail.com',
  password: '12345678'
)

User.create(
  full_name: Faker::Name.name,
  username: 'test_4',
  email: 'test4@mail.com',
  password: '12345678'
)

puts 'Users already seed!'
