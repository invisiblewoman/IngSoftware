class CommentUser < ActiveRecord::Migration[5.1]
  def change
  	add_reference :answer_comments, :user 
  end
end
