# == Schema Information
#
# Table name: offer_prices
#
#  id          :bigint(8)        not null, primary key
#  autopart_id :bigint(8)        not null
#  initial     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class OfferPrice < ApplicationRecord
  belongs_to :autopart, optional: true
end
