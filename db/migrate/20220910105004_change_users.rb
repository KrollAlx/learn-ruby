class ChangeUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :rating
    add_column :users, :rating, :float, default: 0
  end
end
