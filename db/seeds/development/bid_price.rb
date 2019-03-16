engines = Engine.joins(:tender).where('preparation_status= ?', "1")
open_engines = engines.joins(:tender).where('starts_at <= ? AND ends_at >= ?', Time.current, Time.current)
closed_engines = engines.joins(:tender).where('ends_at < ?', Time.current)


###  入札中への入札
open_engine_ids_all = open_engines.pluck(:id)
open_engine_ids = open_engine_ids_all.sample(open_engine_ids_all.count - 10)

open_engine_ids.each do |n|
  bid_price = BidPrice.create!(
    user_id: 1,
    engine_id: n,
    updated_at: Engine.find_by(id: n).tender.starts_at.advance(hours: rand(n)),
    price: 300000 + n
  )
end

open_engine_ids = open_engine_ids_all.sample(open_engine_ids_all.count - 8)

open_engine_ids.each do |n|
  bid_price = BidPrice.create!(
    user_id: 2,
    engine_id: n,
    updated_at: Engine.find_by(id: n).tender.starts_at.advance(hours: rand(n)),
    price: 300000 + n
  )
end

open_engine_ids = open_engine_ids_all.sample(open_engine_ids_all.count - 7)

open_engine_ids.each do |n|
  bid_price = BidPrice.create!(
    user_id: 3,
    engine_id: n,
    updated_at: Engine.find_by(id: n).tender.starts_at.advance(hours: rand(n)),
    price: 300000 + n
  )
end

open_engine_ids = open_engine_ids_all.sample(open_engine_ids_all.count - 6)

open_engine_ids.each do |n|
  bid_price = BidPrice.create!(
    user_id: 4,
    engine_id: n,
    updated_at: Engine.find_by(id: n).tender.starts_at.advance(hours: rand(n)),
    price: 300000 + n
  )
end

# 1.upto(7) do |idx|
#   BidPrice.create!(
#     user_id: 1,
#     engine_id: open_engines.pluck(:id).fetch(idx),
#     price: 90000 * idx
#   )
# end
#
# 1.upto(7) do |idx|
#   BidPrice.create!(
#     user_id: 2,
#     engine_id: open_engines.pluck(:id).fetch(idx),
#     price: 200000 * idx
#   )
# end

### 入札終了している入札会への入札情報登録
closed_engine_ids_all = closed_engines.pluck(:id)
closed_engine_ids = closed_engine_ids_all.sample(closed_engine_ids_all.count - 5)

closed_engine_ids.each do |n|
  bid_price = BidPrice.new(
    user_id: [1, 2, 3, 4].sample,
    engine_id: n,
    created_at: Engine.find_by(id: n).tender.starts_at.advance(hours: n),
    updated_at: Engine.find_by(id: n).tender.starts_at.advance(hours: n),
    price: 300000 + n
  )
  bid_price.save!(validate: false)
end
