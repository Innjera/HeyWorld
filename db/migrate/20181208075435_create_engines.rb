class CreateEngines < ActiveRecord::Migration[5.2]
  def change
    create_table :engines do |t|
      t.references :tender, null: false
      t.string :car_make, null: false                           # 自動車メーカー（TOYOTA）
      t.string :car_model, null: false                          # 車名(PROBOX)
      t.string :car_model_code                                  # 車両型式(NCP50)
      t.date :registration_year                                 # 年式
      t.integer :condition, null: false, default: 0             # 状態（ 0:中古（used）, 1:新品純正部品（New - genuine), 2:リビルト品（new - reman）, 3:コピー品（new copy））
      t.string :engine_model_code                               # エンジン型式
      t.string :mileage                                         # 走行距離
      t.integer :drive, null: false, default: 0                 # (0:2WD(FF), 1:2WD(FR)、2:MR、3:RR、4:4WD)
      t.integer :mission_type, null: false, default: 0          # mission (0:AT, 1:MT, 2:CVT)
      t.integer :starter, null: false, default: 0               # with a starter (0:yes, 1:no, 2:yes but broken)
      t.integer :alternator, null: false, default: 0            # with a alternator (0:yes, 1:no, 2:yes but broken)
      t.integer :compressor, null: false, default: 0            # with a compressor (0:yes, 1:no, 2: yes but broken)
      t.integer :power_steering_pump, null: false, default: 0   # with a Power Steering Pump (0:yes, 1:no, 2: yes but broken)
      t.integer :ecu, null: false, default: 0                   # with engine controll unit (0:yes, 1:no, 2: yes but broken)
      t.integer :engine_harness, null: false, default: 0        # with engine harness (0:yes, 1:no, 2: yes but broken)
      t.integer :front_suspension, null: false, default: 0      # with front_suspension (0:yes, 1:no, 2: yes but broken)
      t.integer :rear_suspension, null: false, default: 0       # with rear_suspension (0:yes, 1:no, 2: yes but broken)
      t.text :remarks                                           # 其の他必要事項
      t.integer :minimum_price, null: false, default: 0         # starting price of the tender
      t.boolean :sold, null: false, default: false              # sold flag

      t.timestamps
    end
  end
end
