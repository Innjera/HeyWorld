car_brands = [
  "TOYOTA",
  "NISSAN",
  "HONDA",
  "SUBARU",
  "MATSUDA"
]

car_models = [
  "Collora",
  "Xtrail",
  "Odessay",
  "Impressa",
  "demio"
]

parts_categories = [
  "Engine",
  "Fuel Pump",
  "Alternator",
  "Starter",
  "Head Light",
  "Fuel Tank",
  "A/C Compressor"
]

%w(株式会社コマゼン 株式会社ユーパーツ 株式会社エコアール 株式会社吉田商会).each do |seller|
  seller = Seller.find_by(company_name: seller)
  0.upto(10) do |idx|
    Autopart.create(
      seller: seller,
      car_brand: "#{car_brands[idx % 5]}",
      car_model: "#{car_models[idx % 5]}",
      parts_category: "#{parts_categories[idx % 7]}",
      sold: [false, false, true][idx % 3]
    )
  end
end
