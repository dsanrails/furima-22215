class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :day
  belongs_to :prefecture
  belongs_to :delivery_fee
  belongs_to :status

  has_one :purchase
  has_one_attached :image
  belongs_to :user

  validates :items_name, :explanation, :price, :image, presence: true
  validates :category_id, :status_id, :delivery_fee_id, :prefecture_id, :day_id, numericality: { other_than: 1 }
  validates :price, numericality: { greater_than: 299, less_than_or_equal_to: 9_999_999 }
end
