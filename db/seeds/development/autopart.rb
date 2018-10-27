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

model_codes = [
  "CBA-NCP95",
  nil,
  "Y12"
]

engine_model_codes = [
  "HR15DE",
  "LDA-MF6",
  nil
]

company_names = [
  "株式会社コマゼン",
  "株式会社ユーパーツ",
  "株式会社エコアール",
  "株式会社吉田商会"
]

company_names.each do |seller|
  seller = Seller.find_by(company_name: seller)
  0.upto(9) do |idx|
    Autopart.create(
      seller: seller,
      car_brand: "#{car_brands[idx % 5]}",
      car_model: "#{car_models[idx % 5]}",
      parts_category: "#{parts_categories[idx % 7]}",
      registration_year: 10.years.ago.advance(month: idx+6),
      condition: [0, 0, 0, 1, 2][idx % 5],
      mileage: 12345 * idx,
      mission_type: [0, 1, 1, 2, 2, 3][idx % 6],
      model_code: "#{model_codes[idx % 3]}",
      engine_model_code: "#{engine_model_codes[idx % 3]}",
      fuel_type: [0, 1, 1, 2, 2][idx % 5],
      drive: [0, 1, 2][idx % 3],
      sold: [0, 0, 1][idx % 3]
    )
  end
end
