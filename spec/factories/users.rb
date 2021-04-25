FactoryBot.define do
  factory :user do
    name           { '名前' }
    firstname      { '苗字' }
    lastname       { '名前' }
    firstname_kana { 'ファーストネームカナ' }
    lastname_kana  { 'ラストネームカナ' }
    date           { '1981-02-03' }
    email          { 'test@example' }
    password       { '00000a' }
    password_confirmation { '00000a' }
  end
end
