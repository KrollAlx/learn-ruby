require 'rails_helper'

RSpec.describe TestsService do
  before(:each) do
    category = Category.create(title: Faker::Book.genre)
    @test = Test.create(title: Faker::Book.title, description: Faker::Lorem.sentence(word_count: 3), category: category)

    question = Question.create(text: Faker::Lorem.sentence(word_count: 5), test: @test)
    right_answer = Answer.create(text: Faker::Lorem.word, question: question)
    Answer.create(text: Faker::Lorem.word, question: question)
    Answer.create(text: Faker::Lorem.word, question: question)
    question.right_answer = right_answer
    question.save!

    question = Question.create(text: Faker::Lorem.sentence(word_count: 4), test: @test)
    right_answer = Answer.create(text: Faker::Lorem.word, question: question)
    Answer.create(text: Faker::Lorem.word, question: question)
    Answer.create(text: Faker::Lorem.word, question: question)
    question.right_answer = right_answer
    question.save!
  end

  describe 'start test' do
    it 'test service is start correctly' do
      TestsService.start_test(@test)
      expect(TestsService.count_questions).to eq @test.questions.size
      expect(TestsService.right_answers_count).to eq 0
      expect(TestsService.test).to eq @test
      expect(TestsService.results).to eq []
      expect(TestsService.questions).to eq @test.questions
    end
  end

  describe 'answer' do
    it 'test should not be completed' do
      TestsService.start_test(@test)
      current_question = @test.questions.first
      answer = current_question.right_answer
      TestsService.answer(answer.id)
      expect(TestsService.test_completed?).to eq false
    end

    it 'next question should be correct' do
      TestsService.start_test(@test)
      current_question = @test.questions.first
      answer = current_question.right_answer
      TestsService.answer(answer.id)
      next_question = @test.questions[1]
      expect(TestsService.next_question).to eq next_question
    end

    it 'test should be completed' do
      answer_1 = @test.questions.first.answers.first
      answer_2 = @test.questions[1].answers.first
      TestsService.start_test(@test)
      TestsService.answer(answer_1.id)
      TestsService.answer(answer_2.id)
      expect(TestsService.test_completed?).to eq true
    end
  end

  describe 'results' do
    it 'result should be correct' do
      answer_1 = @test.questions.first.answers.first
      answer_2 = @test.questions[1].answers[1]
      TestsService.start_test(@test)
      TestsService.answer(answer_1.id)
      TestsService.answer(answer_2.id)
      expected_results = [
        { answer: answer_1.text, result: 'правильный' },
        { answer: answer_2.text, result: 'неправильный' }
      ]
      expect(TestsService.results).to eq expected_results
    end
  end

  describe 'rating' do
    let!(:current_user) { User.create!(Faker::Internet.user('email', 'password')) }

    it 'rating should be updated' do
      answer_1 = @test.questions.first.answers.first
      answer_2 = @test.questions[1].answers[1]
      TestsService.start_test(@test)
      TestsService.answer(answer_1.id)
      TestsService.answer(answer_2.id)
      TestsService.complete_test(current_user)
      expect(current_user.rating).to eq 0.5
    end
  end
end
