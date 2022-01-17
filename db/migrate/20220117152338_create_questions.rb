class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :text
      t.integer :right_answer
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
