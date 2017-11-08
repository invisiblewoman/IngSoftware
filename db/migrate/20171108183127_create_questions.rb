class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :titulo
      t.string :descripcion
      t.string :cuerpo
      t.date :fecha

      t.timestamps
    end
  end
end
