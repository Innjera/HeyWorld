# == Schema Information
#
# Table name: bid_prices
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)        not null
#  engine_id  :bigint(8)        not null
#  price      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BidPrice < ApplicationRecord
  belongs_to :user
  belongs_to :engine

  validates :price, presence: true, numericality: {
    only_integer: true,
    greater_than: 0,
    less_than: 100000000,
    allow_blank: true
  }

end
