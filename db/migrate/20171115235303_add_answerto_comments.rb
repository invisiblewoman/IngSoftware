class AddAnswertoComments < ActiveRecord::Migration[5.1]
  def change
  	add_reference :comments, :answer 
  end
end
