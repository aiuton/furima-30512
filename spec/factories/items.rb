FactoryBot.define do
  factory :item do
    image            {}
    id               { '1' }
    title            { 'example_title' }
    description      { 'example_des' }
    condition_id     { '2' }
    shipping_cost_id { '2' }
    shipping_days_id { '2' }
    prefecture_id    { '2' }
    category_id      { '2' }
    price            { '1000' }

    association :user
  end
end
