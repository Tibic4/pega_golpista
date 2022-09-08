class CreateMyValidators < ActiveRecord::Migration[7.0]
  def change
    create_table :my_validators do |t|

      t.timestamps
    end
  end
end
