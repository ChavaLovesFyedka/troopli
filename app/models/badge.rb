# == Schema Information
#
# Table name: badges
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  category    :string(255)
#  age_level   :string(255)
#  image       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  skill       :string(255)
#

class Badge < ActiveRecord::Base
  has_many :troop_badges
  has_many :troops, through: :troop_badges
  has_many :ideas

  # has_many: ideas, through: badges_ideas
	# has_many: age_levels, through 
end
