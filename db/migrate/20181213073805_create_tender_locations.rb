class CreateTenderLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :tender_locations do |t|

      t.references :seller, null: false #外部キー
      t.string :address, null: false
      t.string :address_country_part, null: false, default: "Japan"
      t.string :address_prefecture_part, null: false
      t.string :address_city_part, null: false
      t.string :address_rest_part, null: false

      t.timestamps
    end
  end
end
