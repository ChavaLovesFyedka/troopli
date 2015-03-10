class Troop < ActiveRecord::Base
  belongs_to :leader, class_name: 'Member'
	# has_many: badges
end
