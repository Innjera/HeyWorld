# == Schema Information
#
# Table name: autoparts
#
#  id         :bigint(8)        not null, primary key
#  seller_id  :bigint(8)        not null
#  car_brand  :string           not null
#  car_model  :string           not null
#  category   :string           not null
#  sold       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Autopart < ApplicationRecord
  belongs_to :seller

  validates :car_brand, presence: true
  validates :category, presence: true
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
