class Tag < ApplicationRecord
	has_many :question_tags
	has_many :tag, through: :question_tags

end
