class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :purchase_histories

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  with_options presence: true do
   validates :nickname
   validates :family_name,      format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
   validates :first_name,       format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
   validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/ }
   validates :first_name_kana,  format: {with: /\A[ァ-ヶー－]+\z/ }
   validates :date_of_birth
  end
end
