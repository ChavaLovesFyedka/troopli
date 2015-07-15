# == Schema Information
#
# Table name: badges_ideas
#
#  id         :integer          not null, primary key
#  badge_id   :integer
#  idea_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class BadgesIdeas < ActiveRecord::Base
  belongs_to :badge
  belongs_to :idea
end
