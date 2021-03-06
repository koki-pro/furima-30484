class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  kanzi = /\A[ぁ-んァ-ン一-龥]+\z/
  katakana = /\A[ァ-ン]+\z/
  with_options presence: true do
    validates :nickname
    validates :first_name,         format: { with:  kanzi, message: 'is invalid. Input full-width characters.' }
    validates :last_name,          format: { with:  kanzi, message: 'is invalid. Input full-width characters.' }
    validates :first_name_reading, format: { with:  katakana, message: 'is invalid. Input full-width katakana characters.' }
    validates :last_name_reading,  format: { with:  katakana, message: 'is invalid. Input full-width katakana characters.' }
    validates :birth_day
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'is invalid. Input using half-width English numbers and letters, using more than 6 characters' }
  end

  has_many :items
  has_many :purchases
end
