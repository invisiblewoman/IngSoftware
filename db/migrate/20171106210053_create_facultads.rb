class CreateFacultads < ActiveRecord::Migration[5.1]
  def change
    create_table :facultads do |t|
      t.string :nombre
      t.string :ubicacion
      t.string :tipo

      t.timestamps
    end
  end
end
