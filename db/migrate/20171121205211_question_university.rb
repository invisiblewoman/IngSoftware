class QuestionUniversity < ActiveRecord::Migration[5.1]
  def change
  	add_reference :questions, :university 
  end
end
