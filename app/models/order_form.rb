class Order < ApplicationRecord
  include ActiveModel::Modele
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building, :tel, :purchase_id
  
  def save
  end
end