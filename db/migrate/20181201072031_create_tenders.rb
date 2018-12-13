class CreateTenders < ActiveRecord::Migration[5.2]
  def change
    create_table :tenders do |t|

      t.references :seller, null: false               # 外部キー
      t.references :tender_location, null: false      # 外部キー
      t.datetime :starts_at, null: false              # 入札開始日時
      t.datetime :ends_at, null: false                # 入札終了日時
      t.string :status, null:false, default: "draft"  # 状態

      t.timestamps
    end
  end
end
