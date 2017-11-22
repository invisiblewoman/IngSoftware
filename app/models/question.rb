class Question < ApplicationRecord
	belongs_to :user
	has_many :question_tags	
	has_many :tags,through: :question_tags
	has_many :answer, dependent: :destroy
	has_many :question_comment,dependent:  :destroy
	scope :search,->(parametro){
		where('titulo LIKE ? OR cuerpo LIKE ?', "%#{parametro}%", "%#{parametro}%")
	}
end
