class Question < ApplicationRecord
  belongs_to :test
  belongs_to :right_answer, class_name: 'Answer', optional: true
  has_many :answers

  def to_s
    text
  end
end
