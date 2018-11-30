class CreateAutoparts < ActiveRecord::Migration[5.2]
  def change
    create_table :autoparts do |t|
      t.references :seller, null: false
      t.string :parts_category, null: false         # 部品名
      t.integer :condition, null: false, default: 0 # 状態（ 0:中古（used）, 1:純正部品（New - genuine), 2:リビルト品（new - reman）, 3:コピー品（new copy））
      t.string :car_make, null: false               # 自動車メーカー（TOYOTA）
      t.string :car_model, null: false              # 車名(PROBOX)
      t.string :car_model_code                      # 型式(NCP50)
      t.date :registration_year                     # 年式
      t.string :engine_model_code                   # エンジン型式
      t.string :mileage                             # 走行距離
      t.integer :drive, default:0                    # (0:2WD(FF), 2:2WD(FR)、3:MR、4:RR、5:4WD)
      t.integer :mission_type, default: 0           # ミッション（ 0:非該当（not applicable）, 1:AT）、2:MT, 3:CVT）
      t.text :remarks                               # 其の他必要事項
      t.integer :sold, null: false, default: 0      # 0:not-sold, 1:sold

      t.timestamps
    end
  end
end
