class Idea < ActiveRecord::Base
	#has_many: badges, through: badges_ideas
	#has_many: age_levels

  has_many :badges_ideas, dependent: :destroy
  has_many :badges, through: :badges_ideas, dependent: :destroy

  # has_many :idea_age_levels, dependent: :destroy
  # has_many :age_levels, through: :idea_age_levels, dependent: :destroy
  # belongs_to :skill

  # validates :name, :presence => true 
end
