class AnswerUser < ActiveRecord::Migration[5.1]
  def change
  	add_reference :answers, :user 
  end
end
