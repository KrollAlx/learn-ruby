# README

Это приложение для прохождения тестов по языку программирования Ruby

Возможности:
* Авторизация
* Прохождение тестов
* Просмотр рейтинга пользователей
* Просмот прогресса пользователя
* Панель администратора (создание новых тестов и тд)

Стек:
* Ruby 2.7
* Ruby on Rails 7
* Postgres SQL
* RSpec
* Devise
* Active Admin
* Turbo
* Stimulus

Гайд по запуску:

* Клонировать репозиторий
* Выполнить следующие команды

```
docker compose build
docker compose run learn_ruby_app rails db:create
docker compose run learn_ruby_app rails db:seed
docker compose up
```

Чтобы прогнать тесты выполните комаду
```
docker compose run learn_ruby_app bundle exec rspec
```
