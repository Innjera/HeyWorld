# == Schema Information
#
# Table name: tender_locations
#
#  id                      :bigint(8)        not null, primary key
#  seller_id               :bigint(8)        not null
#  address                 :string           not null
#  address_country_part    :string           default("Japan"), not null
#  address_prefecture_part :string           not null
#  address_city_part       :string           not null
#  address_rest_part       :string           not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class TenderLocation < ApplicationRecord
  belongs_to :seller
  has_many :tenders

  before_validation do
    if address_prefecture_part && address_city_part && address_rest_part
      self.address = "#{address_prefecture_part}, #{address_city_part}, #{address_rest_part}"
    end
  end

  before_save do
    if address_prefecture_part && address_city_part && address_rest_part
      self.address = "#{address_prefecture_part}, #{address_city_part}, #{address_rest_part}"
    end
  end

end
