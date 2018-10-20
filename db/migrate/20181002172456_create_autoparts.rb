class CreateAutoparts < ActiveRecord::Migration[5.2]
  def change
    create_table :autoparts do |t|
      t.references :seller, null: false
      t.string :parts_category, null: false         # 部品名
      t.integer :condition, null: false, default: 0 # 状態（ 0:中古（used）, 1:純正部品（New - genuine), 2:リビルト品（new - reman）, 3:コピー品（new copy））
      t.string :car_brand, null: false              # 自動車メーカー
      t.string :car_model, null: false              # 車名
      t.date :registration_year                     # 年式
      t.string :model_code                          # 型式
      t.string :fuel                                # Gasoline/Petro or Diesel
      t.string :mileage                             # 走行距離
      t.string :mission_type                        # ミッション（ AT MT ）
      t.string :engine_model_code                   # エンジン型式
      t.string :drive                               # 2WD or 4WD
      t.string :autoparts_maker                     # メーカー
      t.string :genuine_parts_number                # 純正部品番号
      t.text :remarks                               # 其の他必要事項
      t.boolean :sold, null: false, default: false  # 売却済

      t.timestamps
    end
  end
end
