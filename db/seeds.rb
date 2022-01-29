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

Question.create!(text: "Укажите класс ядра Ruby для которого определен метод #each", right_answer: 5, test: test)
question = Question.last
question.answers.create(text: "Interger")
question.answers.create(text: "IO")
question.answers.create(text: "Range")
question.answers.create(text: "String")
question.answers.create(text: "Hash")
question.answers.create(text: "Array")

Question.create!(text: "Какой метод должен существовать для объекта, чтобы использовать этот объект в качестве коллекции в цикле for-in?", right_answer: 5, test: test)
question = Question.last
question.answers.create(text: "#to_a")
question.answers.create(text: "#size")
question.answers.create(text: "#each")
question.answers.create(text: "#initialize")
question.answers.create(text: "#include?")