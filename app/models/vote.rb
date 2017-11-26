class Vote < ApplicationRecord
	belongs_to :user
	belongs_to :votable, polymorphic: true
	scope :positive,-> {where(valor:true) }
	scope :negative,-> {where(valor:false) }
end
