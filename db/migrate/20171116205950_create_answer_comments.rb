class CreateAnswerComments < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_comments do |t|

      t.timestamps
    end
  end
end
