class AddPhotoToCameras < ActiveRecord::Migration[5.2]
  def change
    add_column :cameras, :photo, :string
  end
end
