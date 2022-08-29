class CreateZones < ActiveRecord::Migration[7.0]
  def change
    create_table :zones do |t|
      t.integer :ddd
      t.string :region
      t.float :lat
      t.float :long
      t.integer :count
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
