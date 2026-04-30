require "test_helper"

class VetTest < ActiveSupport::TestCase
  fixtures :vets

  def valid_vet
    Vet.new(
      first_name: "Doc",
      last_name: "Smith",
      email: "uniquevet@example.com",
      specialization: "surgery"
    )
  end

  test "valid vet" do
    assert valid_vet.valid?
  end

  test "invalid without specialization" do
    vet = valid_vet
    vet.specialization = nil
    assert_not vet.valid?
  end

  test "invalid duplicate email" do
    existing = vets(:one)
    vet = valid_vet
    vet.email = existing.email
    assert_not vet.valid?
  end
end