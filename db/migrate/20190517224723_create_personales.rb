class CreatePersonales < ActiveRecord::Migration[5.2]
  def change
    create_table :personales do |t|
      t.string :nombres
      t.string :apellidos

      t.timestamps
    end
  end
end
