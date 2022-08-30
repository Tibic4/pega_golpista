class ChangeDataTypeForPhone < ActiveRecord::Migration[7.0]
  def change
    change_column(:scammers, :phone, :string)
  end
end
