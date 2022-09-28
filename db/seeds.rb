c = Category.create(title: 'Средней сложности')
test = Test.create(title: "Ruby. Средний уровень", description: "Здесь вы можете пройти тест с уровнем «Средний» на тему Ruby", category: c)

question = Question.create(text: "Включать модуль в класс можно при помощи метода", test: test)
question.answers.create(text: "prepend")
right_answer = question.answers.create(text: "include")
question.answers.create(text: "class")
question.answers.create(text: "require")
question.answers.create(text: "extend")
question.right_answer = right_answer
question.save!

question = Question.create(text: "При помощи какого ключевого слова можно досрочно прервать текущую итерацию и начать следующую?", test: test)
question.answers.create(text: "break")
question.answers.create(text: "return")
right_answer = question.answers.create(text: "continue")
question.answers.create(text: "next")
question.right_answer = right_answer
question.save!

question = Question.create(text: "Какой метод НЕ определяет область видимости методов?", test: test)
right_answer = question.answers.create(text: "attr")
question.answers.create(text: "private")
question.answers.create(text: "protected")
question.answers.create(text: "public")
question.right_answer = right_answer
question.save!

question = Question.create(text: "Какой из перечисленных ниже классов нельзя использовать сразу, без предварительного подключения расширения require?", test: test)
question.answers.create(text: "Hash")
question.answers.create(text: "Range")
question.answers.create(text: "Array")
right_answer = question.answers.create(text: "Set")
question.answers.create(text: "String")
question.right_answer = right_answer
question.save!

question = Question.create(text: "Как создается константа в языке Ruby?", test: test)
right_answer = question.answers.create(text: "X = 7")
question.answers.create(text: "const X = 7")
question.answers.create(text: "var = 7; var.freeze")
question.answers.create(text: "define(X, 7)")
question.right_answer = right_answer
question.save!

Admin.create!(email: 'admin@example.com', password: '000000', password_confirmation: '000000')