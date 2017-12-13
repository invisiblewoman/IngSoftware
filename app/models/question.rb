class Question < ApplicationRecord
	belongs_to :user
	has_many :question_tags	
	has_many :question_comment,dependent:  :destroy
	has_many   :votes,dependent: :destroy, as: :votable
	has_many :tags,through: :question_tags
	has_many :answer, dependent: :destroy
	belongs_to :university, optional:true 
	has_many   :votes,dependent: :destroy, as: :votable
	has_many   :reports,dependent: :destroy, as: :reportable
	scope :search,->(parametro){
		where('titulo LIKE ? OR cuerpo LIKE ?', "%#{parametro}%", "%#{parametro}%")
	}
end
