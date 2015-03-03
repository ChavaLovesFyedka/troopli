require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  def setup
    @member = members(:valid_member)
  end
  
  test "can be created" do 
    member = Member.new(email: "hello@example.com",
                        password: "password",
                        password_confirmation: "password",
                        role: "member")

    assert member.save
  end

  test "responds to role" do 
    assert_respond_to @member, :role 
  end

  test "must have a role" do 
    member = Member.new(email: "roleless@example.com",
                        password: "password",
                        password_confirmation: "password",
                        role: "")

    assert_not member.save
  end

  test "role cannot be 'dog'" do 
    member = Member.new(email: "dog@example.com",
                        password: "password",
                        password_confirmation: "password",
                        role: "dog")
    assert_not member.save
  end
end
