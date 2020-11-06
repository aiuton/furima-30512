class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: true }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  validates :password, length: { minimum: 6 }, confirmation: true, format: { with:
   PASSWORD_REGEX }
  validates :family_name,      presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name,       presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day,        presence: true
end
