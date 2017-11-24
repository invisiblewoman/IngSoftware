class UserTag < ActiveRecord::Migration[5.1]
  def change
  	add_reference :user_tags, :user 
  	add_reference :user_tags, :tag
  end
end
