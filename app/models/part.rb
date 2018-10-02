# == Schema Information
#
# Table name: parts
#
#  id         :bigint(8)        not null, primary key
#  seller_id  :bigint(8)        not null
#  car_brand  :string
#  category   :string
#  sold       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Part < ApplicationRecord
end
