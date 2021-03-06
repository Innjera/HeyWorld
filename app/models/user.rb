# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  uid                    :string
#  provider               :string
#  name                   :string
#  first_name             :string
#  last_name              :string
#  image                  :string
#  nationality            :string
#  tel                    :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord

  #### :confirmable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable, :trackable, :omniauthable

  has_many :bid_prices, dependent: :destroy
  has_many :bidded_engines, through: :bid_prices, source: :engine

  before_validation do
    if !name && first_name && last_name
      self.name = "#{first_name} #{last_name}"
    end
  end

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid: auth.uid,
        provider: auth.provider,
        email: auth.info.email,
        # name: auth.info.name,
        first_name: auth.extra.raw_info.first_name,
        last_name: auth.extra.raw_info.last_name,
        password: Devise.friendly_token[0, 20],
        image: auth.info.image
      )
    end

    user

  end

  def biddable_for?(engine)
    engine && !bid_prices.exists?(user_id: self, engine_id: engine.id)
  end

  ### gem country_select
  def country_name
    country = ISO3166::Country[nationality]
    country.translations[I18n.locale.to_s] || country.name
  end

end
