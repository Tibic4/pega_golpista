class ChangeDataTypeForCep < ActiveRecord::Migration[7.0]
  def change
    change_column(:tasks, :cep, :string)
  end
end
