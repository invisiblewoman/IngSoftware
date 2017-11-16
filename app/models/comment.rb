class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :questions
	belongs_to :answers
end
