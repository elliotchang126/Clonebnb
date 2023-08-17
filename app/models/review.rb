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
end
