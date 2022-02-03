class RenameQuestionCountToQuestionsCount < ActiveRecord::Migration[7.0]
  def change
    rename_column :completed_tests, :question_count, :questions_count
  end
end
