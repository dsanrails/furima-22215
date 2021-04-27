class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[\w-]{6,128}+\z/i }
    validates :firstname, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :lastname, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :firstname_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :lastname_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :date
  end
end
