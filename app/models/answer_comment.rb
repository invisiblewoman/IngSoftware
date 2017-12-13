class AnswerComment < ApplicationRecord
	belongs_to :answer
	belongs_to :user
	has_many   :votes,dependent: :destroy, as: :votable
	has_many   :reports,dependent: :destroy, as: :reportable
end
