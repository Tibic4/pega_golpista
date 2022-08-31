class FixColumnNameCount < ActiveRecord::Migration[7.0]
  def change
    rename_column :zones, :count, :count_of_scammers
  end
end
