# == Schema Information
#
# Table name: tender_rules
#
#  id                               :bigint(8)        not null, primary key
#  seller_id                        :bigint(8)        not null
#  payment_cash_in_advance          :boolean          not null
#  payment_bank_transfer_in_advance :boolean          not null
#  payment_credit_card_in_advance   :boolean          not null
#  tax                              :integer          default(0), not null
#  delivery                         :integer          default(0), not null
#  pickup_date                      :integer          not null
#  cancel                           :integer          default(0), not null
#  priority                         :integer          default(0), not null
#  disclose                         :integer          default(0), not null
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#

class TenderRule < ApplicationRecord
  belongs_to :seller, dependent: :destroy
end
