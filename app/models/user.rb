class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    validates :family_name,       format: { with: NAME_REGEX }
    validates :first_name,        format: { with: NAME_REGEX }
    validates :family_name_kana,  format: { with: KANA_REGEX }
    validates :first_name_kana,   format: { with: KANA_REGEX }
    validates :birth_day
    validates :email, uniqueness: { case_sensitive: true }
    validates :nick_name
  end
  validates :email, uniqueness: { case_sensitive: true }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  validates :password, length: { minimum: 6 }, confirmation: true, format: { with:
   PASSWORD_REGEX }
end
