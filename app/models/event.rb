# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  start_at    :datetime
#  end_at      :datetime
#  created_at  :datetime
#  updated_at  :datetime
#  troop_id    :integer
#

class Event < ActiveRecord::Base
  belongs_to :troop

  validates :name, :troop_id, presence: true

  scope :next_3, -> { where("start_at > ?", Time.now)
                      .order(start_at: :asc)
                      .limit(3) }

  def is_on?(date)
    self.start_at.day == date.day &&
    self.start_at.month == date.month &&
    self.start_at.year == date.year
  end

end
