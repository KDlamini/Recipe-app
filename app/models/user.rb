class User < ApplicationRecord
  has_many :post
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :recipes, foreign_key: 'user_id'

  validates :name, presence: true

  def admin?(requested_role)
    role == requested_role.to_s
  end
end
