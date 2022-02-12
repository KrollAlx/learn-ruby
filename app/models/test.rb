class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :completed_tests

  def number_tries(user)
    completed_tests.where(user: user).size
  end
end
