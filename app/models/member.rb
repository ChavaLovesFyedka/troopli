# == Schema Information
#
# Table name: members
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  leadership_request     :boolean
#  role                   :string(255)      default("member")
#

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
