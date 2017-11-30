class CreatePermisos < ActiveRecord::Migration[5.1]
  def change
    create_table :permisos do |t|

      t.timestamps
    end
  end
end
