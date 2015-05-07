class Badge < ActiveRecord::Base
  has_many :troop_badges
  has_many :troops, through: :troop_badges

  # has_many: ideas, through: badges_ideas
	# has_many: age_levels, through 
    has_many :badges_ideas
    has_many :ideas, through: :badges_ideas
end
