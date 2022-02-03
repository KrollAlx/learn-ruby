class AddQuestionCountAndRightAnswersCountToCompletedTests < ActiveRecord::Migration[7.0]
  def change
    add_column :completed_tests, :question_count, :integer
    add_column :completed_tests, :right_answers_count, :integer
  end
end
