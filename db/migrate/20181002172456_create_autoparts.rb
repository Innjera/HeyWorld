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
      t.integer :fuel_type, default: 0              # 0:非該当（not applicable）、1:ガソリン（Gasoline/Petro）、2:ディーゼル（Diesel）、3:ハイブリッド（Hybrid）
      t.string :mileage                             # 走行距離
      t.integer :mission_type, default: 0           # ミッション（ 0:非該当（not applicable）, 1:AT）、2:MT, 3:CVT）
      t.string :engine_model_code                   # エンジン型式
      t.integer :drive, default: 0                  # 0:非該当（not applicable）、1:2WD、2:4WD
      t.string :autoparts_maker                     # メーカー
      t.string :genuine_parts_number                # 純正部品番号
      t.text :remarks                               # 其の他必要事項
      t.integer :sold, null: false, default: 0      # 0:not-sold, 1:sold


      t.timestamps
    end
  end
end
