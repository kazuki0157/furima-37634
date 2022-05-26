FactoryBot.define do
  factory :order_shipping_info do
    token {"tok_abcdefghijk00000000000000000"}
    zip { '123-4567' }
    ken_name_id { 1 }
    city_name { '立川市' }
    address { '1-1' }
    building { '東京ハイツ' }
    tel { Faker::Number.number(digits: 10) } 
  end
end
