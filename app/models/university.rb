class University < ApplicationRecord
	has_many :users
	has_many :question
	has_many :user_universities
end
