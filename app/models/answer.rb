class Answer < ApplicationRecord
  belongs_to :question

  def to_s
    text
  end
end
