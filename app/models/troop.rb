class Troop < ActiveRecord::Base
  belongs_to :leader, class_name: 'Member'
  has_many :events
  has_many :badges
  
  has_attached_file :picture, styles: { thumb: "100x100" }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
