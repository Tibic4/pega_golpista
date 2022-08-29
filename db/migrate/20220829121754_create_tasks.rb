class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.date :date
      t.string :scam_type
      t.integer :cep
      t.float :money_lost

      t.timestamps
    end
  end
end
