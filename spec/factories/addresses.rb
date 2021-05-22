FactoryBot.define do
  factory :address do
    postal_code      {'郵便番号'}
    prefecture_id    {'2'}
    municipality     {'市区町村'}
    address          {'番地'}
    building         {'建物名'}
    tel              {'電話番号'}
  end
end
