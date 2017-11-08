class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :texto
      t.date :fecha

      t.timestamps
    end
  end
end
