class AddCodigoToPersonales < ActiveRecord::Migration[5.2]
  def change
    add_column :personales, :codigo, :string
  end
end
