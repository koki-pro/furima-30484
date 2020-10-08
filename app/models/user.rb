class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  with_options presence: true do
    validates :nickname
    validates :first_name,         format: { with:  /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is invalid. Input full-width characters.' }
    validates :last_name,          format: { with:  /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is invalid. Input full-width characters.' }
    validates :first_name_reading, format: { with:  /\A[ァ-ン]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :last_name_reading,  format: { with:  /\A[ァ-ン]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :birth_day
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'is invalid. Input using half-width English numbers and letters, using more than 6 characters' }
  end

  has_many :items
end
