class AgregarCamposPermisos < ActiveRecord::Migration[5.1]
  def change
  	add_column :permisos, :cantidad, :integer, :default => 0
  	add_column :permisos, :nombre, :string
  	add_column :permisos, :tipo, :string

  end
end
