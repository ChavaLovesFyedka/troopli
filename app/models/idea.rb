# == Schema Information
#
# Table name: ideas
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  category   :string(255)
#  age_level  :string(255)
#  badge_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Idea < ActiveRecord::Base
  belongs_to :badge
	#has_many: badges, through: badges_ideas
	#has_many: age_levels
end
