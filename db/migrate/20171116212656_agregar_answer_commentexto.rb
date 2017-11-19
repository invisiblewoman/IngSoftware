class AgregarAnswerCommentexto < ActiveRecord::Migration[5.1]
  def change
  	add_column :answer_comments, :texto, :string
  end
end
