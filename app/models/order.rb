class Order < ApplicationRecord
  validates :zip, presence: true
  validates :ken_name_id, presence: true
  validates :city_name, presence: true
  validates :address, presence: true
  validates :tel, presence: true

end
