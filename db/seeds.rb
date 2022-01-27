# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# test = Test.create(title: 'First test')
# question = Question.create(text: 'Question text', right_answer: 0)
# answer = Answer.create(text: 'Right answer!!')
# answer.question = question
# question.test = test

# test = Test.create(title: "Тест на знание основ Ruby", description: "Здесь вы можете пройти тест с уровнем «Начальный» на тему Ruby")
test = Test.find_by(id: 6)

Question.create!(text: "В каком варианте вы получите число без пропуска строки от пользователя?", right_answer: 0, test: test)
question = Question.last
question.answers.create(text: "num = gets.chomp()")
question.answers.create(text: "num = gets.to_i")
question.answers.create(text: "num = gets.chomp().to_i")
question.answers.create(text: "num = chomp().to_i")
question.answers.create(text: "num = gets")