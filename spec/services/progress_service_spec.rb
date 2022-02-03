require 'rails_helper'

RSpec.describe ProgressService do
  let!(:current_user) { User.create!(Faker::Internet.user('email', 'password')) }
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

    TestsService.start_test(@test)
    TestsService.answer(0)
    TestsService.answer(1)
    TestsService.complete_test(current_user)

    TestsService.start_test(@test)
    TestsService.answer(0)
    TestsService.answer(2)
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
