# == Schema Information
#
# Table name: tenders
#
#  id                 :bigint(8)        not null, primary key
#  seller_id          :bigint(8)        not null
#  tender_location_id :bigint(8)        not null
#  starts_at          :datetime         not null
#  ends_at            :datetime         not null
#  preparation_status :integer          default(0), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Tender < ApplicationRecord
  belongs_to :seller
  belongs_to :tender_location

  has_many :engines, dependent: :destroy
  accepts_nested_attributes_for :engines, allow_destroy: true

  validates :starts_at, :ends_at, presence: true
  validates :preparation_status, presence: true

  validate do
    if starts_at && ends_at && starts_at > ends_at
      errors.add(:ends_at, :too_early)
    end
  end

  scope :open, -> { where(preparation_status:1)}

  before_validation do
    if starts_at_date_part && starts_at_time_part
      if starts_at_date_part.present? && starts_at_time_part.present?
        self.starts_at = "#{starts_at_date_part} #{starts_at_time_part}"
      else
        self.starts_at = nil
      end
    end

    if ends_at_date_part && ends_at_time_part
      if ends_at_date_part.present? && ends_at_time_part.present?
        self.ends_at = "#{ends_at_date_part} #{ends_at_time_part}"
      else
        self.ends_at = nil
      end
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

  def tender_status
    time_now = Time.current
    ### before tender
    if time_now < starts_at
      tender_status = 0
    ### tender ongoing
    elsif starts_at < time_now && time_now < ends_at
      tender_status = 1
    ### tender finished
    elsif ends_at < time_now
      tender_status = 2
    end
    tender_status
  end

end
