class Member < ActiveRecord::Base
  has_one :troop, foreign_key: 'leader_id'

  ROLES = ["super admin", "leader", "member"]

  validates :role, presence: true, inclusion: { in: ROLES }

  scope :with_request, -> { where('leadership_request = ? AND role != ?',
                                    true, 'leader') }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_admin?
    self.role == 'super admin'
  end

  def is_leader?
    self.role == 'leader'
  end

  def is_member?
    self.role == 'member'
  end
end
