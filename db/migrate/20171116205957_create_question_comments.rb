class CreateQuestionComments < ActiveRecord::Migration[5.1]
  def change
    create_table :question_comments do |t|

      t.timestamps
    end
  end
end
