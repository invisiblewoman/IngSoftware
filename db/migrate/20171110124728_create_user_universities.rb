class CreateUserUniversities < ActiveRecord::Migration[5.1]
  def change
    create_table :user_universities do |t|

      t.timestamps
    end
  end
end
