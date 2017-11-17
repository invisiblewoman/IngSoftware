class MigracionCompleta < ActiveRecord::Migration[5.1]
  def change
  	add_column :question_comments, :fecha, :date
  	add_column :question_comments, :texto, :string
  	add_reference :question_comments, :user 
  	add_reference :question_comments, :question 
  end
end
