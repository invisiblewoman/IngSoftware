class QuestionAddBestAnswer < ActiveRecord::Migration[5.1]
  def change
  	add_column :questions, :bestAnswer, :integer
  end
end
