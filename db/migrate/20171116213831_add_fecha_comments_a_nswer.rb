class AddFechaCommentsANswer < ActiveRecord::Migration[5.1]
  def change
  	add_column :answer_comments, :fecha, :date
  end
end
