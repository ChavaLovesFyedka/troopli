class Troop < ActiveRecord::Base
  belongs_to :leader, class_name: 'Member'
  has_many :events
  has_many :troop_badges
  has_many :badges, through: :troop_badges

  validates :name, presence: true

  has_attached_file :picture, styles: { thumb: "100x100" }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
