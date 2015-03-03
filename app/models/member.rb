class Member < ActiveRecord::Base
  ROLES = ["super admin", "leader", "member"]

  validates :role, presence: true, inclusion: { in: ROLES }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def requested_leadership?
    self.leadership_request
  end
end
