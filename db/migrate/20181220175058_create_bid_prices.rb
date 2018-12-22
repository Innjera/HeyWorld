class CreateBidPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :bid_prices do |t|

      t.references :user, null:false
      t.references :engine, null:false
      t.integer :price, null:false

      t.timestamps
    end
  end
end
