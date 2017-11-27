class AddDefaultValueVotesUser < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :votos, :integer, :default => 0
  end
end
