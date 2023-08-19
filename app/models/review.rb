# == Schema Information
#
# Table name: reviews
#
#  id            :bigint           not null, primary key
#  listing_id    :bigint           not null
#  user_id       :bigint           not null
#  cleanliness   :integer          not null
#  communication :integer          not null
#  check_in      :integer          not null
#  accuracy      :integer          not null
#  location      :integer          not null
#  value         :integer          not null
#  body          :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Review < ApplicationRecord
    validates :cleanliness, :communication, :check_in, :accuracy, :location, :value, :body, presence: true

    validates :cleanliness, :communication, :check_in, :accuracy, :location, :value, numericality: { only_integer: true }, inclusion: { in: 1..5 }

    belongs_to :listing
    
    belongs_to :user

    def average_rating
        ((cleanliness + communication + check_in + accuracy + location + value) / 6.0).round(2)
    end
end
