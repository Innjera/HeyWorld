# == Schema Information
#
# Table name: autoparts
#
#  id                :bigint(8)        not null, primary key
#  seller_id         :bigint(8)        not null
#  parts_category    :string           not null
#  condition         :integer          default(0), not null
#  car_make          :string           not null
#  car_model         :string           not null
#  car_model_code    :string
#  registration_year :date
#  engine_model_code :string
#  mileage           :string
#  drive             :integer          default(0)
#  mission_type      :integer          default(0)
#  remarks           :text
#  sold              :integer          default(0), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Autopart < ApplicationRecord
  belongs_to :seller

  has_one :offer_price, dependent: :destroy
  accepts_nested_attributes_for :offer_price, allow_destroy: true

  validates :car_make, presence: true
  validates :parts_category, presence: true
  validates :sold, presence: true

  CARMAKE_OPTIONS = {
    "TOYOTA" => "トヨタ", "NISSAN" => "日産", "HONDA" => "ホンダ", "MAZDA" => "マツダ",
    "SUBARU" => "スバル", "MITSUBISHI" => "三菱", "ISUZU" => "イスズ", "HINO" => "日野",
    "SUZUKI" => "スズキ", "DAIHATSU" => "ダイハツ"
  }

  AUTOPARTS_OPTIONS = {
    "Engine" => "Engine単体", "Engine&Transmission" => "Engine & Transmissionセット",
    "Complete Engine" => "Complete Engine (Engine, Starter, Alternator, Transnission, Suspension)",
    "Engine Assay" => "Engine Assay",
    "Alternator" => "Alternator (Dynamo)",
    "Transmission" => "Transmission",
    "Starter" => "Starter"
  }

end
