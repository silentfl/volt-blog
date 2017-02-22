## Usage
* Rails 5
* Postgres 9
* Rspec 3
* ActiveModelSerializers
* Kaminari
* DeviseTokenAuth

## Local install
```
git clone git@github.com:silentfl/volt-blog.git
cd volt-blog
bundle install
rake db:create
rake db:migrate
HOST=localhost rails s
```

## Endpoints
1. Auth

2. Post
  * create post
  * get by id
  * get posts by page and per_page
