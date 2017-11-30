class AddDefaultValueQuestion < ActiveRecord::Migration[5.1]
  def change
  	change_column :questions, :bestAnswer, :integer, :default => 0
  end
end
