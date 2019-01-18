# company_names = [
#   "株式会社コマゼン",
#   "株式会社ユーパーツ",
#   "株式会社吉田商会"
# ]

# company_names.each do |seller|
#   seller = Seller.find_by(company_name: seller)
#   0.upto(2) do |idx|
#     Tender.create!(
#       seller: seller,
#       tender_location: TenderLocation.all.sample,
#       starts_at: datetime0.advance(days: rand(5)+idx, hours: 7),
#       ends_at: datetime0.advance(days: idx+8, hours: 7),
#       status: %w(draft ready)[idx % 2]
#     )
#   end
# end

datetime0 = Time.current.beginning_of_day

  Tender.create!(
    seller: Seller.find_by(company_name: "株式会社コマゼン"),
    tender_location: TenderLocation.find_by(seller_id: 1),
    starts_at: datetime0.advance(days: -10, hours: 9),
    ends_at: datetime0.advance(days: -3, hours: 15),
    status: %w(draft ready).sample
  )

  Tender.create!(
    seller: Seller.find_by(company_name: "株式会社コマゼン"),
    tender_location: TenderLocation.find_by(seller_id: 1),
    starts_at: datetime0.advance(days: -1, hours: 9),
    ends_at: datetime0.advance(days: +2, hours: 12),
    status: %w(draft ready).sample
  )

  Tender.create!(
    seller: Seller.find_by(company_name: "株式会社コマゼン"),
    tender_location: TenderLocation.find_by(seller_id: 1),
    starts_at: datetime0.advance(days: 0, hours: 9),
    ends_at: datetime0.advance(days: +3, hours: 12),
    status: %w(draft ready).sample
  )

  Tender.create!(
    seller: Seller.find_by(company_name: "株式会社コマゼン"),
    tender_location: TenderLocation.find_by(seller_id: 1),
    starts_at: datetime0.advance(days: +4, hours: 9),
    ends_at: datetime0.advance(days: +7, hours: 12),
    status: %w(draft ready).sample
  )

0.upto(2) do |idx|
  Tender.create!(
    seller: Seller.find_by(company_name: "株式会社ユーパーツ"),
    tender_location: TenderLocation.find_by(seller_id: 2),
    starts_at: datetime0.advance(days: -2+idx, hours: 7),
    ends_at: datetime0.advance(days: 8+idx, hours: 7),
    status: %w(draft ready)[idx % 2]
  )
end

0.upto(2) do |idx|
  Tender.create!(
    seller: Seller.find_by(company_name: "株式会社エコアール"),
    tender_location: TenderLocation.find_by(seller_id: 3),
    starts_at: datetime0.advance(days: idx, hours: 7),
    ends_at: datetime0.advance(days: 6+idx, hours: 7),
    status: %w(draft ready)[idx % 2]
  )
end
