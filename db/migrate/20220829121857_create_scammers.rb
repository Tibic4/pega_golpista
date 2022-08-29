class CreateScammers < ActiveRecord::Migration[7.0]
  def change
    create_table :scammers do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :website
      t.text :description
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
