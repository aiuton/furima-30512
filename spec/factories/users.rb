FactoryBot.define do
  factory :user do
    id                    { '1' }
    nick_name             { 'tarou' }
    email                 { 'sample@gmail.com' }
    password              { 'abc4567' }
    encrypted_password    { 'abc4567' }
    family_name           { '山田' }
    family_name_kana      { 'ヤマダ' }
    first_name            { '太郎' }
    first_name_kana       { 'タロウ' }
    birth_day             { '2000-01-01' }
  end
end
