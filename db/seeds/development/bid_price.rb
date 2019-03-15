engines = Engine.joins(:tender).where('preparation_status= ?', "1")
open_engines = engines.joins(:tender).where('starts_at <= ? AND ends_at >= ?', Time.current, Time.current)
closed_engines = engines.joins(:tender).where('ends_at < ?', Time.current)


###  入札中への入札
1.upto(7) do |idx|
  BidPrice.create!(
    user_id: 1,
    engine_id: open_engines.pluck(:id).fetch(idx),
    price: 90000 * idx
  )
end

1.upto(7) do |idx|
  BidPrice.create!(
    user_id: 2,
    engine_id: open_engines.pluck(:id).fetch(idx),
    price: 200000 * idx
  )
end

### 入札終了している入札会への入札情報登録
closed_engine_ids_all = closed_engines.pluck(:id)
closed_engine_ids = closed_engine_ids_all.sample(closed_engine_ids_all.count - 5)

closed_engine_ids.each do |n|
  bid_price = BidPrice.new(
    user_id: [1, 2].sample,
    engine_id: n,
    created_at: Engine.find_by(id: n).tender.starts_at,
    updated_at: Engine.find_by(id: n).tender.starts_at,
    price: 300000 + n
  )
  bid_price.save!(validate: false)
end
