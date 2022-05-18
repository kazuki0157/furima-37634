FactoryBot.define do
  factory :item do
    product_name        { Faker::Name.name }
    description         { Faker::Lorem.sentence }
    category_id         { Faker::Number.within(range: 1..10) }
    condition_id        { Faker::Number.within(range: 1..6) }
    pay_for_shipping_id { Faker::Number.within(range: 1..2) }
    ken_name_id         { Faker::Number.within(range: 1..47) }
    shipping_days_id    { Faker::Number.within(range: 1..3) }
    price               { Faker::Number.within(range: 300..999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
