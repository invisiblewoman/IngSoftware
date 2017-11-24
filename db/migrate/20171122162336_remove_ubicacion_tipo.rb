class RemoveUbicacionTipo < ActiveRecord::Migration[5.1]
  def change
  	remove_column :universities, :tipo
  	remove_column :universities, :ubicacion
  end
end
