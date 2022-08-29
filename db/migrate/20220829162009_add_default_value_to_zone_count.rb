class AddDefaultValueToZoneCount < ActiveRecord::Migration[7.0]
  def change
    change_column :zones, :count, :integer, default: 0
  end
end
