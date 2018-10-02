class CreateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts do |t|
      t.references :seller, null: false
      t.string :car_brand
      t.string :category
      t.boolean :sold, null: false, default: false

      t.timestamps
    end
  end
end
