john = User.create(
  nickname: 'John',
  password: 'password',
  email: 'john@example.com'
)

bob = User.create(
  nickname: 'Bob',
  password: 'password',
  email: 'bob@example.com'
)

first_post = john.posts.create(
  title: 'First post',
  body: 'It is my first post'
)

second_post = john.posts.create(
  title: 'Second post',
  body: "I'm blogger =)",
  user: john
)

Comment.create(
  body: 'Nice',
  post: first_post,
  user: bob
)

Comment.create(
  body: 'thx',
  post: first_post,
  user: john
)

Comment.create(
  body: 'any comment?',
  post: second_post,
  user: john
)
