class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string 	:razon
      t.belongs_to :user
      t.integer :reportable_id
      t.string  :reportable_type
      t.timestamps
    end
    add_index :reports, [:reportable_type, :reportable_id]
  end
end
