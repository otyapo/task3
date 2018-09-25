class AddBodyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Body, :text
  end
end
