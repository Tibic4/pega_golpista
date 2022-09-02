class RemoveForeignKeyFromZones < ActiveRecord::Migration[7.0]
  def change
    remove_column :zones, :task_id, :integer
  end
end
