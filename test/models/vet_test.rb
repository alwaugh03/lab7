require "test_helper"

class VetTest < ActiveSupport::TestCase
  def valid_vet
    Vet.new(
      first_name: "Doc",
      last_name: "Smith",
      email: "doc@example.com",
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
    Vet.create!(first_name: "A", last_name: "B", email: "test@mail.com", specialization: "x")
    vet = valid_vet
    vet.email = "test@mail.com"
    assert_not vet.valid?
  end
end