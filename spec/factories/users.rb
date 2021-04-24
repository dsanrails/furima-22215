FactoryBot.define do
  factory :user do
    name           {'名前'}
    firstname      {'苗字'}
    lastname       {'名前'}
    firstname_kana {'ファーストネームカナ'}
    lastname_kana  {'ラストネームカナ'}
    date           {'生年月日'}
    email          {'test@example'}
    password       {'000000'}
  end
end