class CreateCameras < ActiveRecord::Migration[5.2]
  def change
    create_table :cameras do |t|
      t.string :name
      t.string :brand
      t.integer :price
      t.text :description
      t.string :availability

      t.timestamps
    end
  end
end
