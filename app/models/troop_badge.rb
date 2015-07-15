# == Schema Information
#
# Table name: troop_badges
#
#  id         :integer          not null, primary key
#  troop_id   :integer
#  badge_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class TroopBadge < ActiveRecord::Base
  belongs_to :troop
  belongs_to :badge
end
