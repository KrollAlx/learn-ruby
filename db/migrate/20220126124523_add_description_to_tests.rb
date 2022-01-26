class AddDescriptionToTests < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :description, :text
  end
end
