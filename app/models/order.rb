class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :shipping_info

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :ken_name
end
