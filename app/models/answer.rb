class Answer < ApplicationRecord
	belongs_to :user
	belongs_to :question
	has_many :answer_comment,dependent:  :destroy
	has_many   :votes,dependent: :destroy, as: :votable

	validates :texto, presence: true

	has_many   :reports,dependent: :destroy, as: :reportable

end
