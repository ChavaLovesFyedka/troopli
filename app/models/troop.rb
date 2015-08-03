# == Schema Information
#
# Table name: troops
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  created_at           :datetime
#  updated_at           :datetime

class Troop < ActiveRecord::Base
  has_many :users
  has_one :troop_page
  has_many :scouts

  validates :name, presence: true
end
