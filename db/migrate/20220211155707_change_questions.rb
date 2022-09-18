class ChangeQuestions < ActiveRecord::Migration[7.0]
  def change
    # remove_foreign_key :questions, :answers, column: :right_answer_id
    # remove_column :questions, :right_answer_id
    add_reference :questions, :right_answer, foreign_key: { to_table: :answers }
  end
end
