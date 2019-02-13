company_names = [
  "株式会社コマゼン",
  "株式会社ユーパーツ",
  "株式会社エコアール",
  "株式会社吉田商会"
]

company_names.each do |seller|
  seller = Seller.find_by(company_name: seller)
    TenderRule.create(
      seller: seller,
      payment_cash_in_advance: [true, false, true].sample,
      payment_bank_transfer_in_advance: [true, false, true].sample,
      payment_credit_card_in_advance: [true, false, true].sample,
      tax: [0,0,0,1].sample,
      delivery: [1,0,0,0,0].sample,
      pickup_date: rand(0..10),
      cancel: 0,
      priority: 0,
      disclose: [0, 0, 0, 1, 0, 0].sample
    )
end
