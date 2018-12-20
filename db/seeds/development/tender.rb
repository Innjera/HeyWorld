company_names = [
  "株式会社コマゼン",
  "株式会社ユーパーツ",
  "株式会社エコアール",
  "株式会社吉田商会"
]

datetime0 = Time.current.beginning_of_day

company_names.each do |seller|
  seller = Seller.find_by(company_name: seller)
  0.upto(2) do |idx|
    Tender.create!(
      seller: seller,
      tender_location: TenderLocation.all.sample,
      starts_at: datetime0.advance(days: rand(5)+idx, hours: 7),
      ends_at: datetime0.advance(days: idx+8, hours: 7),
      status: %w(draft ready)[idx % 2]
    )
  end
end
