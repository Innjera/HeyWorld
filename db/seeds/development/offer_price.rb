1.upto(40) do |idx|
  OfferPrice.create(
    autopart_id: idx,
    initial: idx*8000
  )
end
