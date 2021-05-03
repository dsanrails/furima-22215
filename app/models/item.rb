class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :items_name, :explanation, presence: true
  validates :category_id, :status_id, :delicery_fee_id, :prefecture_id, :day_id, numericality: { other_than: 1 } 
end
