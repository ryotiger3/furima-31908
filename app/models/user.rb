class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :purchase_histories

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,           presence: true, format: { with: VALID_EMAIL_REGEX }

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password,         format: { with: VALID_PASSWORD_REGEX }

  validates :nickname,         presence: true
  validates :family_name,      presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name,       presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana,  presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :date_of_birth,    presence: true
end
