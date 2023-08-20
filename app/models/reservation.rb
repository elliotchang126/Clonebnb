# == Schema Information
#
# Table name: reservations
#
#  id         :bigint           not null, primary key
#  listing_id :bigint           not null
#  user_id    :bigint           not null
#  num_guests :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Reservation < ApplicationRecord

    validates :listing_id, :user_id, :num_guests, :start_date, :end_date, presence: true

    belongs_to :listing

    belongs_to :user

end
