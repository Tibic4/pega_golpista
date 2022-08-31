class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :zones, :long, :longitude
    rename_column :zones, :lat, :latitude
  end
end
