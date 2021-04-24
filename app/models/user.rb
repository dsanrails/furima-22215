class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[\w-]{8,128}+\z/i }
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :firstname_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
  validates :lastname_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
  validates :date, presence: true
end
