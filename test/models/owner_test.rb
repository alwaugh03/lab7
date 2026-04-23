require "test_helper"

class OwnerTest < ActiveSupport::TestCase
  def valid_owner
    Owner.new(
      first_name: "John",
      last_name: "Doe",
      email: "john@example.com",
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
    Owner.create!(first_name: "A", last_name: "B", email: "test@mail.com", phone: "1")
    owner = valid_owner
    owner.email = "test@mail.com"
    assert_not owner.valid?
  end
end