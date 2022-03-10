class User < ApplicationRecord
  has_many :foods, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :recipes, foreign_key: 'user_id', dependent: :destroy

  validates :name, presence: true

  def admin?(requested_role)
    role == requested_role.to_s
  end
end
