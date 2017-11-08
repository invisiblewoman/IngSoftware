class CreatePregunta < ActiveRecord::Migration[5.1]
  def change
    create_table :pregunta do |t|
      t.string :texto
      t.string :fecha
      t.integer :votos

      t.timestamps
    end
  end
end
