class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :apellido
      t.string :email
      t.string :descripcion
      t.string :foto
      t.integer :puntos

      t.timestamps
    end
  end
end
