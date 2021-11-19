after :users do
  puts 'Seeding Tweets...'

  100.times do
    user_id = Faker::Number.between(from: 1, to: 3)
    user = User.find(user_id)

    random_chars = rand(1..280)

    tweet_content = Faker::Lorem.paragraph_by_chars(number: random_chars, supplemental: false)
    tweet_created_at = Faker::Time.between(from: DateTime.now - 3000, to: DateTime.now)

    user.tweets.create(content: tweet_content, created_at: tweet_created_at)
  end

  puts 'Tweets already seed!'
end