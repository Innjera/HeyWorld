# == Schema Information
#
# Table name: autoparts
#
#  id         :bigint(8)        not null, primary key
#  seller_id  :bigint(8)        not null
#  car_brand  :string
#  category   :string
#  sold       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Autopart < ApplicationRecord
  belongs_to :seller
end
