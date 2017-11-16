class AddUserComments2 < ActiveRecord::Migration[5.1]
   def change
  	add_reference :comments, :user 
  end
end
