FactoryBot.define do
  factory :destination do
    postcode { '111-1111' }
    prefecture_id    { '2' }
    city             { 'aaa' }
    street_address   { 'aaa' }
    building_name    { 'aaa' }
    phone_number     { '0901234567' }
  end
end
