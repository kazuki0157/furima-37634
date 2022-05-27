class CreateShippingInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_infos do |t|
      t.string     :zip,          null: false
      t.integer    :ken_name_id,  null: false
      t.string     :city_name,    null: false
      t.string     :address,      null: false
      t.string     :building
      t.string     :tel,          null: false
      t.references :order,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
