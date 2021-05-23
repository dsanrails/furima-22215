FactoryBot.define do
  factory :order_form do
    postal_code {'123-4567'}
    prefecture_id {1}
    municipality {'中央区'}
    address {'丸の内'}
    tel {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
