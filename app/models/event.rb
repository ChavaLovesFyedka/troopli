class Event < ActiveRecord::Base
  belongs_to :troop

  validates :name, presence: true

  scope :next_3, -> { where("start_at > ?", Time.now)
                      .order(start_at: :asc)
                      .limit(3) }

  def is_on?(date)
    self.start_at.day == date.day &&
    self.start_at.month == date.month &&
    self.start_at.year == date.year
  end

end
