class CreateOfferPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :offer_prices do |t|
      t.references :autopart, null: false
      t.integer :initial, null: false     #initial price

      t.timestamps
    end
  end
end
