class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :purchase_histories

  validates :nickname,         presence: true
  validates :family_name,      presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name,       presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana,  presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :date_of_birth,    presence: true
end
