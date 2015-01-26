class Idea < ActiveRecord::Base
	has_many: badges, through: badges_ideas
	#has_many: age_levels
end
