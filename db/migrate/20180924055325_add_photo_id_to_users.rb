class AddPhotoIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :photo_id, :string
  end
end
