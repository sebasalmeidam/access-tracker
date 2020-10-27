class AddAlmuerzoToRegistros < ActiveRecord::Migration[5.2]
  def change
    add_column :registros, :empezo_almuerzo, :datetime
    add_column :registros, :termino_almuerzo, :datetime
  end
end
