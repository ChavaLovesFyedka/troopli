class Troop < ActiveRecord::Base
  belongs_to :leader, class_name: 'Member'
  
  has_attached_file :picture, styles: { thumb: "100x100", medium: "300x300" }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
