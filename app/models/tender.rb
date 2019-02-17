# == Schema Information
#
# Table name: tenders
#
#  id                 :bigint(8)        not null, primary key
#  seller_id          :bigint(8)        not null
#  tender_location_id :bigint(8)        not null
#  starts_at          :datetime         not null
#  ends_at            :datetime         not null
#  status             :integer          default(0), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Tender < ApplicationRecord
  belongs_to :seller
  belongs_to :tender_location

  has_many :engines, dependent: :destroy
  accepts_nested_attributes_for :engines, allow_destroy: true

  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validates :starts_at_date_part, presence: true
  validates :status, presence: true

  validate do
    if starts_at > ends_at
      errors.add(:ends_at, :too_early)
    end
  end

  scope :open, -> { where(status:1)}

  before_validation do
    if starts_at_date_part && starts_at_time_part
      self.starts_at = "#{starts_at_date_part} #{starts_at_time_part}"
    end

    if ends_at_date_part && ends_at_time_part
      self.ends_at = "#{ends_at_date_part} #{ends_at_time_part}"
    end
  end

  attr_writer :starts_at_date_part, :starts_at_time_part,
  :ends_at_date_part, :ends_at_time_part

  def starts_at_date_part
    @starts_at_date_part ||= starts_at&.strftime('%Y-%m-%d')
  end

  def starts_at_time_part
    @starts_at_time_part ||= starts_at&.strftime('%H:%M')
  end

  def ends_at_date_part
    @ends_at_date_part ||= ends_at&.strftime('%Y-%m-%d')
  end

  def ends_at_time_part
    @ends_at_time_part ||= ends_at&.strftime('%H:%M')
  end

end
