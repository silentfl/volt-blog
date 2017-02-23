10.times do
  User.create(
    nickname: Faker::Internet.user_name,
    password: Faker::Internet.password(8),
    email: Faker::Internet.email
  )
end

users = User.all

users.each do |user|
  rand(10).times do
    post = user.posts.create(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph
    )
    
    rand(20).times do
      Comment.create(
        body: Faker::Lorem.sentence,
        post: post,
        user: users.sample
      )
    end
  end
end
