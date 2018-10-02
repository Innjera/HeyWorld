class CreateAutoparts < ActiveRecord::Migration[5.2]
  def change
    create_table :autoparts do |t|
      t.references :seller, null: false
      t.string :car_brand, null: false
      t.string :car_model, null: false
      t.string :category, null: false
      t.boolean :sold, null: false, default: false

      t.timestamps
    end
  end
end
