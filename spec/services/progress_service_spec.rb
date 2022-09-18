require 'rails_helper'

RSpec.describe ProgressService do
  let!(:current_user) { User.create!(Faker::Internet.user('email', 'password')) }
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

    TestsService.start_test(@test)
    TestsService.answer(TestsService.next_question.answers.first.id)
    TestsService.answer(TestsService.next_question.answers.first.id)
    TestsService.complete_test(current_user)

    TestsService.start_test(@test)
    TestsService.answer(TestsService.next_question.answers.first.id)
    TestsService.answer(TestsService.next_question.answers.first.id)
    TestsService.complete_test(current_user)
  end

  describe 'completed tests' do
    it 'should return tests completed by current user' do
      completed_tests = ProgressService.completed_tests(current_user)
      expected = Test.all.select { |t| t.number_tries(current_user).positive? }
      expect(completed_tests).to eq expected
    end
  end

  describe 'get completed test' do
    it 'should return certain completed test by current user' do
      completed_test = ProgressService.completed_tests_records(current_user, @test)
      expect(completed_test).to eq CompletedTest.where(user: current_user, test: @test)
    end
  end
end
