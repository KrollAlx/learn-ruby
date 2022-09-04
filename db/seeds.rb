# test = Test.create(title: 'First test')
# question = Question.create(text: 'Question text', right_answer: 0)
# answer = Answer.create(text: 'Right answer!!')
# answer.question = question
# question.test = test

# test = Test.create(title: "Ruby. Средний уровень", description: "Здесь вы можете пройти тест с уровнем «Средний» на тему Ruby")
# # test = Test.find_by(id: 6)
#
# question = Question.create(text: "Включать модуль в класс можно при помощи метода", right_answer: 1, test: test)
# question.answers.create(text: "prepend")
# question.answers.create(text: "include")
# question.answers.create(text: "class")
# question.answers.create(text: "require")
# question.answers.create(text: "extend")
#
# question = Question.create(text: "При помощи какого ключевого слова можно досрочно прервать текущую итерацию и начать следующую?", right_answer: 2, test: test)
# question.answers.create(text: "break")
# question.answers.create(text: "return")
# question.answers.create(text: "continue")
# question.answers.create(text: "next")
#
# question = Question.create(text: "Какой метод НЕ определяет область видимости методов?", right_answer: 0, test: test)
# question.answers.create(text: "attr")
# question.answers.create(text: "private")
# question.answers.create(text: "protected")
# question.answers.create(text: "public")
#
# question = Question.create(text: "Какой из перечисленных ниже классов нельзя использовать сразу, без предварительного подключения расширения require?", right_answer: 3, test: test)
# question.answers.create(text: "Hash")
# question.answers.create(text: "Range")
# question.answers.create(text: "Array")
# question.answers.create(text: "Set")
# question.answers.create(text: "String")
#
# question = Question.create(text: "Как создается константа в языке Ruby?", right_answer: 0, test: test)
# question.answers.create(text: "X = 7")
# question.answers.create(text: "const X = 7")
# question.answers.create(text: "var = 7; var.freeze")
# question.answers.create(text: "define(X, 7)")

# c = Category.create(title: 'Для начинающих')
# test = Test.find(6)
# test.category = c
# test.save!
#
# c = Category.create(title: 'Средней сложности')
# test = Test.find(7)
# test.category = c
# test.save!
# Admin.create!(email: 'admin@example.com', password: '000000', password_confirmation: '000000') if Rails.env.development?