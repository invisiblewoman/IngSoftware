class AddDafaultFotoToUser < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :foto, :string, :default => "perfil.jpg"
  end
end
