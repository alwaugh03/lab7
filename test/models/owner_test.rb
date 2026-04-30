require "test_helper"

class OwnerTest < ActiveSupport::TestCase
  fixtures :owners

  def valid_owner
    Owner.new(
      first_name: "John",
      last_name: "Doe",
      email: "unique@example.com",
      phone: "123456"
    )
  end

  test "valid owner" do
    assert valid_owner.valid?
  end

  test "invalid without first_name" do
    owner = valid_owner
    owner.first_name = nil
    assert_not owner.valid?
  end

  test "invalid without email" do
    owner = valid_owner
    owner.email = nil
    assert_not owner.valid?
  end

  test "invalid duplicate email" do
    existing = owners(:one)
    owner = valid_owner
    owner.email = existing.email
    assert_not owner.valid?
  end
end