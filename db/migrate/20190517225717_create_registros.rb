class CreateRegistros < ActiveRecord::Migration[5.2]
  def change
    create_table :registros do |t|
      t.date :fecha
      t.datetime :entrada
      t.datetime :salida
      t.references :personal, foreign_key: true

      t.timestamps
    end
  end
end
