engines = Engine.joins(:tender).where('status= ?', "ready")
open_engines = engines.joins(:tender).where('starts_at <= ?', Time.current)

1.upto(15) do |idx|
  BidPrice.create!(
    user_id: 1,
    engine_id: open_engines.pluck(:id).fetch(idx),
    price: 9000 * idx
  )
end

1.upto(15) do |idx|
  BidPrice.create!(
    user_id: 2,
    engine_id: open_engines.pluck(:id).fetch(idx),
    price: 800 * idx
  )
end
