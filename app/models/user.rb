class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :first_name,         format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角文字で入力してください"}
    validates :last_name,          format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角文字で入力してください"}
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カナで入力してください"}
    validates :last_name_reading,  format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カナで入力してください"}
    validates :birth_day
  end       
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, presence: true,
            format: { with: VALID_PASSWORD_REGEX, message: "は半角6文字以上、英数混合で入力してください"}
  validates :email, uniqueness: { case_sensitive: true }          
end
