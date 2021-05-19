class OrderForm 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building, :tel, :purchase_id
  
  validates :postal_code, :prefecture_id, :municipality, :address, :tel, presence: true
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :tel, format: { with: /\A\d{11}\z/ }

  def save
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, tel: tel, purchase_id: purchase_id)
    Purchase.create(user_id: user_id, item_id: item_id)
  end
end