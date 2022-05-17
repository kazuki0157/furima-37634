class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Category
  belongs_to :Condition
  belongs_to :Ken_name
  belongs_to :Pay_for_shipping
  belongs_to :Shiooing_days
end
