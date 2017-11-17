class CommentAnswer < ActiveRecord::Migration[5.1]
  def change
  	add_reference :answer_comments, :answer 
  end
end
