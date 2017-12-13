class Answer < ApplicationRecord
	belongs_to :user
	belongs_to :question
	has_many :answer_comment,dependent:  :destroy
	has_many   :votes,dependent: :destroy, as: :votable
	has_many   :reports,dependent: :destroy, as: :reportable
end
