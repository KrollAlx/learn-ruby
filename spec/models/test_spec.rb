require 'rails_helper'

RSpec.describe Test, type: :model do
  describe 'number_tries' do
    let!(:current_user) { User.create!(Faker::Internet.user('email', 'password')) }
    let!(:current_test) { Test.create!(title: Faker::Book.title, description: Faker::Lorem.sentence(word_count: 3)) }

    it 'the number_tries must be equal to the number of passes' do
      CompletedTest.create!(test: current_test, user: current_user)
      expect(current_test.number_tries(current_user)).to eq 1

      CompletedTest.create!(test: current_test, user: current_user)
      CompletedTest.create!(test: current_test, user: current_user)
      expect(current_test.number_tries(current_user)).to eq 3
    end
  end
end
