class Prefecture < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '北海道' },
    { id: 3, name: '青森' },
    { id: 4, name: '岩手' },
    { id: 5, name: '宮城' },
    { id: 6, name: '秋田' },
    { id: 7, name: '山形' },
    { id: 8, name: '福島' },
    { id: 9, name: '茨城' },
    { id: 10, name: '栃木' }
  ]

  include ActiveHash::Associations
  has_many :items
  has_many :orders
end
