class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.boolean :valor
      t.timestamps
      t.references :user
      t.integer	   :votable_id
      t.string	   :votable_type
    end
  end
end
