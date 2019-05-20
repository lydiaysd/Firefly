class AddAddressToCameras < ActiveRecord::Migration[5.2]
  def change
    add_column :cameras, :address, :string
  end
end
