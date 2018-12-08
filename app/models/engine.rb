# == Schema Information
#
# Table name: engines
#
#  id                  :bigint(8)        not null, primary key
#  seller_id           :bigint(8)        not null
#  car_make            :string           not null
#  car_model           :string           not null
#  car_model_code      :string
#  registration_year   :date
#  condition           :integer          default(0), not null
#  engine_model_code   :string
#  mileage             :string
#  drive               :integer          default(0), not null
#  mission_type        :integer          default(0), not null
#  starter             :integer          default(0), not null
#  alternator          :integer          default(0), not null
#  compressor          :integer          default(0), not null
#  power_steering_pump :integer          default(0), not null
#  ecu                 :integer          default(0), not null
#  engine_harness      :integer          default(0), not null
#  front_suspension    :integer          default(0), not null
#  rear_suspension     :integer          default(0), not null
#  remarks             :text
#  minimum_price       :integer          default(0), not null
#  sold                :boolean          default(FALSE), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Engine < ApplicationRecord
  belongs_to :seller

  validates :car_make, presence: true

  CARMAKE_OPTIONS = {
    "TOYOTA" => "トヨタ", "NISSAN" => "日産", "HONDA" => "ホンダ", "MAZDA" => "マツダ",
    "SUBARU" => "スバル", "MITSUBISHI" => "三菱", "ISUZU" => "イスズ", "HINO" => "日野",
    "SUZUKI" => "スズキ", "DAIHATSU" => "ダイハツ",
    "VOLKSWAGEN" => "フォルクスワーゲン", "BMW"=>"ビーエムダブリュー", "MERCEDESBENZ" => "メルセデスベンツ",
    "RENAULT" => "ルノー", "PEUGEOT" => "プジョー", "CITROEN" => "シトロエン",
    "FORD" => "フォード", "GM" => "ゼネラルモーター"
  }

end
