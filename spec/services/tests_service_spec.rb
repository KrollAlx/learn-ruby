require 'rails_helper'

RSpec.describe TestsService do
  before(:each) do
    @test = Test.create(title: Faker::Book.title, description: Faker::Lorem.sentence(word_count: 3))

    question = Question.create(text: Faker::Lorem.sentence(word_count: 5), right_answer: 0, test: @test)
    question.answers.create(text: Faker::Lorem.word)
    question.answers.create(text: Faker::Lorem.word)
    question.answers.create(text: Faker::Lorem.word)

    question = Question.create(text: Faker::Lorem.sentence(word_count: 4), right_answer: 2, test: @test)
    question.answers.create(text: Faker::Lorem.word)
    question.answers.create(text: Faker::Lorem.word)
    question.answers.create(text: Faker::Lorem.word)
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
      TestsService.answer(answer)
      expect(TestsService.test_completed?).to eq false
    end

    it 'next question should be correct' do
      TestsService.start_test(@test)
      current_question = @test.questions.first
      answer = current_question.right_answer
      TestsService.answer(answer)
      next_question = @test.questions[1]
      expect(TestsService.next_question).to eq next_question
    end

    it 'test should be completed' do
      TestsService.start_test(@test)
      TestsService.answer(0)
      TestsService.answer(1)
      expect(TestsService.test_completed?).to eq true
    end
  end

  describe 'results' do
    it 'result should be correct' do
      TestsService.start_test(@test)
      TestsService.answer(0)
      TestsService.answer(1)
      expected_results = [
        { answer: 0, result: 'правильный' },
        { answer: 1, result: 'неправильный' }
      ]
      expect(TestsService.results).to eq expected_results
    end
  end
end
