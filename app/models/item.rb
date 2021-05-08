class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :day
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :status

  belongs_to :category
  has_one :purchase
  has_one_attached :image
  belongs_to :user

  validates :items_name, :explanation, :price, :image, presence: true
  validates :category_id, :status_id, :delivery_fee_id, :prefecture_id, :day_id, numericality: { other_than: 1 }
  validates :price, numericality: { greater_than: 299, less_than: 9_999_999 }
end
