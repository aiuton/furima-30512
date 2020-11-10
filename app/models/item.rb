class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_days

  with_options presence: true do
    ID_REGEX = { other_than: 1 }.freeze
    PRICE_REGEX = { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }.freeze
    validates :image
    validates :title
    validates :description
    validates :condition_id, numericality: ID_REGEX
    validates :shipping_cost_id, numericality: ID_REGEX
    validates :shipping_days_id, numericality: ID_REGEX
    validates :prefecture_id, numericality: ID_REGEX
    validates :category_id, numericality: ID_REGEX
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: PRICE_REGEX
  end
end
