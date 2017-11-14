class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	belongs_to :university, optional: true
	has_many :questions, dependent: :destroy
	has_many :answers,dependent: :destroy

  def full_name
  	"#{nombre} #{apellido}"
  end
end
