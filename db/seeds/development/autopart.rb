car_makes = [
  "TOYOTA",
  "TOYOTA",
  "HONDA",
  "TOYOTA",
  "MITSUBISHI"
]

car_models = [
  "Probox",
  "Vits",
  "Odyssey",
  "Noah",
  "Canter"
]

parts_categories = [
  "Engine",
  "Fuel Pump",
  "Alternator",
  "Starter",
  "Head Light"
]

car_model_codes = [
  "NCP50",
  "SCP90",
  "RB1",
  "ACR60",
  "FB300B"
]

engine_model_codes = [
  "2NZFE",
  "2SZFE",
  "K24A",
  "1AZFSE",
  "4DR5"
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
      car_make: "#{car_makes[idx % 5]}",
      car_model: "#{car_models[idx % 5]}",
      car_model_code: "#{car_model_codes[idx % 3]}",
      parts_category: "#{parts_categories[idx % 7]}",
      registration_year: 10.years.ago.advance(month: idx+6),
      engine_model_code: "#{engine_model_codes[idx % 3]}",
      condition: [0, 0, 0, 1, 2][idx % 5],
      mileage: 12345 * idx,
      mission_type: [0, 1, 1, 2, 2, 3][idx % 6],
      drive: [0, 1, 2][idx % 3],
      sold: [0, 0, 1][idx % 3]
    )
  end
end
