class Badge < ActiveRecord::Base
	has_many: ideas, through: badges_ideas
	#has_many: age_levels, through 
end
