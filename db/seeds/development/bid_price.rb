engines = Engine.joins(:tender).where('preparation_status= ?', "1")
open_engines = engines.joins(:tender).where('starts_at <= ? AND ends_at >= ?', Time.current, Time.current)

1.upto(15) do |idx|
  BidPrice.create!(
    user_id: 1,
    engine_id: open_engines.pluck(:id).fetch(idx),
    price: 90000 * idx
  )
end

1.upto(15) do |idx|
  BidPrice.create!(
    user_id: 2,
    engine_id: open_engines.pluck(:id).fetch(idx),
    price: 200000 * idx
  )
end
