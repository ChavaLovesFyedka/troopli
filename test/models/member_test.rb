require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  def setup
    @member = members(:valid_member)
  end
  
  test "can be created" do 
    member = Member.new(email: "hello@example.com",
                        password: "password",
                        password_confirmation: "password")
    assert member.save
  end

  test "responds to role" do 
    assert_respond_to @member, :role 
  end

  test "role cannot be 'dog'" do 
    member = Member.new(email: "dog@example.com",
                        password: "password",
                        password_confirmation: "password",
                        role: "dog")
    assert_not member.save
  end

  test "default role is 'member'" do 
    member = Member.create(email: "member@example.com",
                        password: "password",
                        password_confirmation: "password")

    assert member.role == "member"
  end

  test "responds to leadership_request" do 
    assert_respond_to @member, :leadership_request
  end

  test "scope :with_request returns members who have requested leadership" do 
    members = Member.with_request

    assert members.all? do |member|
      member.leadership_request == true && member.role != 'leader'
    end
  end
end
