class RemoveBodyFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :Body, :text
  end
end
