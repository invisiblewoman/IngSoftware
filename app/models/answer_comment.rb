class AnswerComment < ApplicationRecord
	belongs_to :answer
	belongs_to :user
	has_many   :votes,dependent: :destroy, as: :votable
end
