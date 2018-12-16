class CreateTenderRules < ActiveRecord::Migration[5.2]
  def change
    create_table :tender_rules do |t|

      t.references :seller, null:false
      t.integer :tax, null:false, default:0         #消費税（0:excluded, 1:included）
      t.integer :payment, null:false, default:0     #支払方法 (0:cash only, 1:, 2:CVT)
      t.integer :delivery, null:false,default:0     #配送（0:不可, 1:可能（費用買主負担））
      t.integer :pickup_date, null:false            #引取期限（入札終了後）
      t.integer :cancel, null:false, default:0      #キャンセル (0:no, 1:negotiable)
      t.integer :priority, null:false, default:0    #同価格優先度 (0:先に入札した人優先)
      t.integer :disclose, null:false, default:0    #落札価格開示 (0:開示, 1:非開示)

      t.timestamps
    end
  end
end
