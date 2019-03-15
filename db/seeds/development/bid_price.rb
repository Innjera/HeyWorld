engines = Engine.joins(:tender).where('preparation_status= ?', "1")
open_engines = engines.joins(:tender).where('starts_at <= ?', Time.current)

1.upto(15) do |idx|
  bid_price = BidPrice.new(
    user_id: 1,
    engine_id: open_engines.pluck(:id).fetch(idx),
    price: 9000 * idx,
  )

  bid_price.save!(validate: false)
end

1.upto(15) do |idx|
  bid_price = BidPrice.new(
    user_id: 2,
    engine_id: open_engines.pluck(:id).fetch(idx),
    price: 20000 * idx,
  )

  bid_price.save!(validate: false)  
end
