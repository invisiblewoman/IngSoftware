class AddUniversityToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_reference :users, :university 
  end
end
