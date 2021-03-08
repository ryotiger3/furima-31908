FactoryBot.define do
  factory :product do
    association :user
    name {"a12345テスト出品"}
    description {"テストtestてすと"}
    category_id {2}
    condition_id {2}
    shipping_charged_id {2}
    shipping_days_id {2}
    prefecture_id {2}
    price {300}
  end

end
