class CreateComentarios < ActiveRecord::Migration[5.1]
  def change
    create_table :comentarios do |t|
      t.string :texto
      t.string :fecha
      t.integer :votos

      t.timestamps
    end
  end
end
