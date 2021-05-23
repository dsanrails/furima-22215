class OrderForm 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building, :tel, :purchase_id, :token
  
  validates :postal_code, :prefecture_id, :municipality, :address, :tel, presence: true
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }#, message: "is invalid. Include hyphen(-)"}
  validates :tel, format: { with: /\A\d{11}\z/ }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :token, presence: true
  def save
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, tel: tel, purchase_id: purchase_id)
    Purchase.create(user_id: user_id, item_id: item_id)
  end
end