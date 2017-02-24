## Часть 1

1.1 Модели
  * Post
  * User
  * Comment

1.2 Эндпоинты
  * Аутентификация на основе [DeviseTokenAuth](https://github.com/lynndylanhurley/devise_token_auth)
  * POST /api/v1/posts.json
  * GET  /api/v1/posts/:post_id.json
  * GET  /api/v1/posts.json - пагинация на [Kaminari](https://github.com/kaminari/kaminari)

1.3 Прочие требования
  * Rails 5
  * Postgres 9
  * Rspec 3
  * ActiveModelSerializers
  * DeviseTokenAuth
  * Покрытие кода тестами (97.21%)

## Часть 2
2.1 Загрузка аватара
  НЕ реализовано

2.2 Reports
  * POST /api/v1/reports/by_author.json (public)
  * Если не указаны даты отчета - берется месяц
  * Данные отчета НЕ по требованию
  * БД заполнена тестовыми данными (faker)

2.3 Heroku
