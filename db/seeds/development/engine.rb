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

##　開催前入札会
1.upto(20) do |idx|
  tender  = Tender.find_by(id: [1, 2, 3].sample)
  Engine.create!(
    seller: tender.seller,
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
    intake_manifold: [0, 0, 0, 0, 1, 0, 0, 1][idx % 8],
    throttle_body: [0, 0, 0, 0, 0, 0, 0, 1][idx % 8],
    exhaust_manifold: [0, 0, 0, 0, 1, 0, 0, 0][idx % 8],
    ignition_coil: [0, 0, 0, 0, 1, 0, 0, 0][idx % 8],
    turbo_charger: [0, 0, 0, 0, 1, 0, 0, 0][idx % 8],
    fly_wheel: [0, 0, 0, 0, 1, 0, 0, 0][idx % 8],
    power_steering_pump: [0, 0, 0, 0, 1, 0, 0, 0][idx % 8],
    starter: [0, 0, 1, 0, 1, 0, 0, 0][idx % 8],
    alternator: [0, 0, 0, 1, 1, 0, 0, 0][idx % 8],
    engine_harness: [1, 0, 1, 0, 0, 0, 0, 0][idx % 8],
    front_suspension: [0, 0, 0, 1, 1, 0, 0, 0][idx % 8],
    rear_suspension: [0, 0, 0, 0, 0, 0, 1, 1][idx % 8],
    minimum_price: 1000 * idx,
    sold: 0
  )
end

##　開催中入札会
1.upto(35) do |idx|
  tender  = Tender.find_by(id: [4, 5, 6, 7].sample)
  Engine.create!(
    seller: tender.seller,
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
    intake_manifold: [0, 0, 0, 0, 1, 0, 0, 1][idx % 8],
    throttle_body: [0, 0, 0, 0, 0, 0, 0, 1][idx % 8],
    exhaust_manifold: [0, 0, 0, 0, 1, 0, 0, 0][idx % 8],
    ignition_coil: [0, 0, 0, 0, 1, 0, 0, 0][idx % 8],
    turbo_charger: [0, 0, 0, 0, 1, 0, 0, 0][idx % 8],
    fly_wheel: [0, 0, 0, 0, 1, 0, 0, 0][idx % 8],
    power_steering_pump: [0, 0, 0, 0, 1, 0, 0, 0][idx % 8],
    starter: [0, 0, 1, 0, 1, 0, 0, 0][idx % 8],
    alternator: [0, 0, 0, 1, 1, 0, 0, 0][idx % 8],
    engine_harness: [1, 0, 1, 0, 0, 0, 0, 0][idx % 8],
    front_suspension: [0, 0, 0, 1, 1, 0, 0, 0][idx % 8],
    rear_suspension: [0, 0, 0, 0, 0, 0, 1, 1][idx % 8],
    minimum_price: 1000 * idx,
    sold: 0
  )
end

##　開催前
1.upto(24) do |idx|
  tender  = Tender.find_by(id: [8, 9, 10, 11, 12, 13].sample)
  Engine.create!(
    seller: tender.seller,
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
    intake_manifold: [0, 0, 0, 0, 1, 0, 0, 1][idx % 8],
    throttle_body: [0, 0, 0, 0, 0, 0, 0, 1][idx % 8],
    exhaust_manifold: [0, 0, 0, 0, 1, 0, 0, 0][idx % 8],
    ignition_coil: [0, 0, 0, 0, 1, 0, 0, 0][idx % 8],
    turbo_charger: [0, 0, 0, 0, 1, 0, 0, 0][idx % 8],
    fly_wheel: [0, 0, 0, 0, 1, 0, 0, 0][idx % 8],
    power_steering_pump: [0, 0, 0, 0, 1, 0, 0, 0][idx % 8],
    starter: [0, 0, 1, 0, 1, 0, 0, 0][idx % 8],
    alternator: [0, 0, 0, 1, 1, 0, 0, 0][idx % 8],
    engine_harness: [1, 0, 1, 0, 0, 0, 0, 0][idx % 8],
    front_suspension: [0, 0, 0, 1, 1, 0, 0, 0][idx % 8],
    rear_suspension: [0, 0, 0, 0, 0, 0, 1, 1][idx % 8],
    minimum_price: 1000 * idx,
    sold: 0
  )
end
