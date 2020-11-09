FactoryBot.define do
  factory :item_order do
    
        postcode         { '111-1111' }
        prefecture_id    { 2 }
        city             { '東京都' }
        street_address   { '渋谷' }
        building_name    { '渋谷ハイツ' }
        phone_number     { '09012345678' }
        token            { 'tok_aaaaaaaaaaaaaa'  }

        association :user
        association :item
      end
    end