class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	belongs_to :university, optional: true
  has_many   :votes
  has_many   :user_universities
  has_many   :user_tags
  has_many   :universities, through: :user_universities
  has_many   :tags, through: :user_tags
	has_many :questions, dependent: :destroy
	has_many :answers, dependent: :destroy
  has_many :answer_comments, dependent: :destroy
  has_many :question_comments, dependent: :destroy
  
  def full_name
  	"#{nombre} #{apellido}"
  end
  
end
