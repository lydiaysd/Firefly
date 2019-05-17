class ChangeAvailabilityToStartDate < ActiveRecord::Migration[5.2]
  def change
    remove_column :cameras, :availability
    add_column :cameras, :start_date, :date
    add_column :cameras, :end_date, :date
  end
end
