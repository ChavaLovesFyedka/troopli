# == Schema Information
#
# Table name: troops
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  description          :text
#  age_level            :integer
#  created_at           :datetime
#  updated_at           :datetime
#  leader_id            :integer
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

class Troop < ActiveRecord::Base
  belongs_to :leader, class_name: 'Member'
  has_many :events
  has_many :troop_badges
  has_many :badges, through: :troop_badges

  validates :name, presence: true

  has_attached_file :picture, styles: { thumb: "100x100" }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
