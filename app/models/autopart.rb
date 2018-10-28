# == Schema Information
#
# Table name: autoparts
#
#  id                   :bigint(8)        not null, primary key
#  seller_id            :bigint(8)        not null
#  parts_category       :string           not null
#  condition            :integer          default(0), not null
#  car_brand            :string           not null
#  car_model            :string           not null
#  registration_year    :date
#  model_code           :string
#  fuel_type            :integer          default(0)
#  mileage              :string
#  mission_type         :integer          default(0)
#  engine_model_code    :string
#  drive                :integer          default(0)
#  autoparts_maker      :string
#  genuine_parts_number :string
#  remarks              :text
#  sold                 :integer          default(0), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Autopart < ApplicationRecord
  belongs_to :seller

  has_one :offer_price, dependent: :destroy
  accepts_nested_attributes_for :offer_price, allow_destroy: true

  validates :car_brand, presence: true
  validates :parts_category, presence: true
  validates :sold, presence: true

  CARBRAND_OPTIONS = {
    "TOYOTA" => "トヨタ", "NISSAN" => "日産", "HONDA" => "ホンダ", "MAZDA" => "マツダ",
    "SUBARU" => "スバル", "MITSUBISHI" => "三菱", "ISUZU" => "イスズ", "HINO" => "日野",
    "SUZUKI" => "スズキ", "DAIHATSU" => "ダイハツ"
  }

  AUTOPARTS_OPTIONS = {
    "Engine" => "Engine単体", "Engine&Transmission" => "Engine & Transmissionセット", "Alternator" => "Alternator",
    "Transmissions Automatic" => "Transmissions Automatic", "Starter" => "Starter"
  }

end
