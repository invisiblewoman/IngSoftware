class AgregarReferenciaUserUniversidad < ActiveRecord::Migration[5.1]
  def change
  	add_reference :user_universities, :user 
  	add_reference :user_universities, :university 
  end
end
