class Badge < ActiveRecord::Base
  belongs_to :troop	
  #has_many: ideas, through: badges_ideas
	#has_many: age_levels, through 
end
