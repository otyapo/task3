class CreateUserImages < ActiveRecord::Migration[5.2]
  def change
    create_table :user_images do |t|
      t.string :profile_image_id

      t.timestamps
    end
  end
end
