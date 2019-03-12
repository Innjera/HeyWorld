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
  validate :check_bid_price
  validate :check_biddable_item
  validate :check_biddable_user, on: :create

  def check_biddable_user
    unless user.biddable_for?(self.engine)
      errors.add(:price, :already_bidded)
    end
  end

  def check_biddable_item
    unless self.engine.tender.preparation_status == 1 && self.engine.tender.tender_status == 1
      errors.add(:base, :not_biddable)
    end
  end

  def check_bid_price
    if price && self.engine && price < self.engine.minimum_price
      errors.add(:price, :too_low_price)
    end
  end


end
