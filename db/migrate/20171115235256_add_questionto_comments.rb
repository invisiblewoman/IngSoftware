class AddQuestiontoComments < ActiveRecord::Migration[5.1]
  def change
  	add_reference :comments, :question
  end
end
