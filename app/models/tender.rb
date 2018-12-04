# == Schema Information
#
# Table name: tenders
#
#  id         :bigint(8)        not null, primary key
#  seller_id  :bigint(8)        not null
#  starts_at  :datetime         not null
#  ends_at    :datetime         not null
#  status     :string           default("draft"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tender < ApplicationRecord
  belongs_to :seller

  STATUS_VALUES = %w(draft ready)

  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validates :status, inclusion: {in: STATUS_VALUES}

  scope :open, -> { where(status: "ready")}

  before_save do
    if starts_at_date_part && starts_at_time_part
      self.starts_at = "#{starts_at_date_part} #{starts_at_time_part}"
    end

    if ends_at_date_part && ends_at_time_part
      self.ends_at = "#{ends_at_date_part} #{ends_at_time_part}"
    end
  end

  attr_writer :starts_at_date_part, :starts_at_time_part, :ends_at_date_part, :ends_at_time_part

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
