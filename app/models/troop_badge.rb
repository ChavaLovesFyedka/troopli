class TroopBadge < ActiveRecord::Base
  belongs_to :troop
  belongs_to :badge
end
