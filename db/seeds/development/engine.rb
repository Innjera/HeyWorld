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

1.upto(60) do |idx|
  tender  = Tender.find_by(id: rand(1..12))
  Engine.create!(
      tender: tender,
      car_make: "#{car_makes[idx % 5]}",
      car_model: "#{car_models[idx % 5]}",
      car_model_code: "#{car_model_codes[idx % 3]}",
      registration_year: 15.years.ago.advance(year: idx),
      condition: [0, 0, 0, 1, 2][idx % 5],
      engine_model_code: "#{engine_model_codes[idx % 3]}",
      mileage: 12345 * idx,
      drive: [0, 1, 4][idx % 3],
      mission_type: [0, 1, 1, 2, 2, 3][idx % 6],
      starter: [0, 0, 1, 0, 1, 0, 0, 0][idx % 8],
      alternator: [0, 0, 0, 1, 1, 0, 0, 0][idx % 8],
      power_steering_pump: [1, 0, 0, 0, 1, 0, 0, 0][idx % 8],
      engine_harness: [1, 0, 1, 0, 0, 0, 0, 0][idx % 8],
      front_suspension: [0, 0, 0, 1, 1, 0, 0, 0][idx % 8],
      rear_suspension: [0, 0, 0, 0, 0, 0, 1, 1][idx % 8],
      minimum_price: 1000 * idx,
      sold: [0, 0, 1][idx % 3]
    )
  end
