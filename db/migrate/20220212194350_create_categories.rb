class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :title
    end

    add_reference :tests, :category, foreign_key: true
  end
end
