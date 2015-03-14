class Event < ActiveRecord::Base
  belongs_to :troop

  scope :next_3, -> { where("start_at > ?", Time.now)
                      .order(start_at: :asc)
                      .limit(3) }
end
